---
layout: single
title: "Library Composition: Kokkos+HYPRE"
permalink: /kokkos-hypre/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This demo uses two libraries that are already built into the `ecpe4s/e4s-cuda:26.06` images -- **Kokkos** and **Hypre** -- and links a small application against both of them:

- **Kokkos** builds a right-hand-side vector on the GPU
- **Hypre** solves the resulting linear system with PCG
- **Kokkos** reduces the solution back on the GPU

> **Other platforms:** `ecpe4s/e4s-cuda:26.06` specifies the CUDA/NVIDIA-GPU x86_64 image used below, defaulting to cuda90 build targets. ecpe4s/e4s-cuda:26.06-cuda80 and ecpe4s/e4s-cuda:26.06-cuda120 are available for different GPU hardware.  E4S also publishes CPU-only, Intel oneAPI, and ROCm images (see the [Container Download page](/container-download/)). Packages from the CPU image missing on a GPU image can be pulled in as a prebuilt, signed binaries from the [E4S Spack build cache](/e4s-buildcache/) instead of compiled from source.

---

## 1. Run the E4S CUDA Container


Start the container in interactive mode with GPU access (Consider mounting a writable directory on the host to save your work):

```bash
docker run --gpus all -it --rm \
  -w /tmp/work \
  ecpe4s/e4s-cuda:26.06
```

Verify the GPU is visible from inside the container:

```bash
nvidia-smi
```

## 2. Discover What Spack Already Provides

Ask Spack what packages are installed in this image by explicit request:

```bash
spack find -x
```

Look for `kokkos` and `hypre` in the listing. 

The container carries a broad set of tools. Build tools and other dependencies, every package Spack installed, will be shown by: 

```bash
spack find
```

Check the exact variant strings before loading to find the package configured for your needs. For example,  since GPU-enabled images typically add a `+cuda` variant you can try the search below.  -l will print the unique spack hash assigned to the install and -v will print the variants:

```bash
spack find -lxv kokkos+cuda
spack find -lxv hypre+cuda
```

## 3. Load Kokkos and Hypre

Load both packages, matching the `+cuda` variant reported above, using the hash value so Spack knows the exact package you want. (Hash values will differ between different images).

```bash
KOKKOS_HASH=$(spack find --format '/{hash}' -x kokkos+cuda)
HYPRE_HASH=$(spack find --format '/{hash}' -x hypre+cuda)
spack load $KOKKOS_HASH
spack load $HYPRE_HASH
```

Confirm they're loaded and record their install prefixes -- your build will need these:

```bash
spack find --loaded

KOKKOS_DIR=$(spack location -i $KOKKOS_HASH)
HYPRE_DIR=$(spack location -i $HYPRE_HASH)
echo "KOKKOS_DIR=$KOKKOS_DIR"
echo "HYPRE_DIR=$HYPRE_DIR"
```

## 4. Write a Small App on Top of Both Libraries

Create and enter a project directory:

```bash
mkdir -p src
cd src
```

Create `CMakeLists.txt`:

```bash
cat > CMakeLists.txt <<'EOF'
cmake_minimum_required(VERSION 3.18)
project(e4s_dev_demo LANGUAGES CXX)

find_package(Kokkos REQUIRED)

add_executable(dev_demo main.cpp)
target_link_libraries(dev_demo PRIVATE Kokkos::kokkos)

if(DEFINED HYPRE_DIR)
  target_include_directories(dev_demo PRIVATE ${HYPRE_DIR}/include)
  target_link_directories(dev_demo PRIVATE ${HYPRE_DIR}/lib)
  target_link_libraries(dev_demo PRIVATE HYPRE)
endif()

find_package(MPI REQUIRED)
target_link_libraries(dev_demo PRIVATE MPI::MPI_CXX)
EOF
```

Create `main.cpp`:

```bash
cat > main.cpp <<'EOF'
#include <Kokkos_Core.hpp>
#include <mpi.h>
#include <HYPRE.h>
#include <HYPRE_IJ_mv.h>
#include <HYPRE_parcsr_ls.h>
#include <cstdio>
#include <utility> // For std::make_pair

// Problem size -- change this and rebuild to see Step 6 in action.
static const int n = 1000;

int main(int argc, char** argv) {
  MPI_Init(&argc, &argv);
  Kokkos::initialize(argc, argv);
  {
    int rank, nprocs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    int rows_per_rank = n / nprocs;
    int remainder = n % nprocs;
    int local_n = rows_per_rank + (rank < remainder ? 1 : 0);
    int ilower = rank * rows_per_rank + (rank < remainder ? rank : remainder);
    int iupper = ilower + local_n - 1;

    // Build the right-hand side on the GPU with Kokkos.
    Kokkos::View<double*> d_rhs("rhs", local_n);
    Kokkos::parallel_for("fill_rhs", local_n, KOKKOS_LAMBDA(const int i) {
      d_rhs(i) = 1.0;
    });
    // We'll feed d_rhs directly to HYPRE!

    if (rank == 0) {
      printf("Kokkos execution space: %s\n",
             Kokkos::DefaultExecutionSpace::name());
    }

    // Hand the system over to Hypre for the actual solve.
    HYPRE_Init();

    // Explicitly instruct HYPRE to use GPU memory and execute on the GPU
    HYPRE_SetMemoryLocation(HYPRE_MEMORY_DEVICE);
    HYPRE_SetExecutionPolicy(HYPRE_EXEC_DEVICE);

    HYPRE_IJMatrix A;
    HYPRE_IJMatrixCreate(MPI_COMM_WORLD, ilower, iupper, ilower, iupper, &A);
    HYPRE_IJMatrixSetObjectType(A, HYPRE_PARCSR);
    HYPRE_IJMatrixInitialize(A);

    // Pre-calculate non-zeros and allocate Host views
    int max_nnz = 3 * local_n;
    Kokkos::View<int*, Kokkos::HostSpace> h_ncols("ncols", local_n);
    Kokkos::View<int*, Kokkos::HostSpace> h_rows("rows", local_n);
    Kokkos::View<int*, Kokkos::HostSpace> h_cols("cols", max_nnz);
    Kokkos::View<double*, Kokkos::HostSpace> h_vals("vals", max_nnz);

    int nnz = 0;
    for (int i = ilower; i <= iupper; i++) {
      h_rows(i - ilower) = i;
      int cols_count = 0;
      if (i - 1 >= 0) { h_cols(nnz) = i - 1; h_vals(nnz) = -1.0; nnz++; cols_count++; }
      h_cols(nnz) = i; h_vals(nnz) = 2.0; nnz++; cols_count++;
      if (i + 1 < n)  { h_cols(nnz) = i + 1; h_vals(nnz) = -1.0; nnz++; cols_count++; }
      h_ncols(i - ilower) = cols_count;
    }

    // Mirror arrays to the GPU
    Kokkos::View<int*> d_ncols("d_ncols", local_n);
    Kokkos::View<int*> d_rows("d_rows", local_n);
    Kokkos::View<int*> d_cols("d_cols", nnz);
    Kokkos::View<double*> d_vals("d_vals", nnz);

    Kokkos::deep_copy(d_ncols, h_ncols);
    Kokkos::deep_copy(d_rows, h_rows);
    // Deep copy only the populated subset of the contiguous arrays
    Kokkos::deep_copy(Kokkos::subview(d_cols, std::make_pair(0, nnz)), 
                      Kokkos::subview(h_cols, std::make_pair(0, nnz)));
    Kokkos::deep_copy(Kokkos::subview(d_vals, std::make_pair(0, nnz)), 
                      Kokkos::subview(h_vals, std::make_pair(0, nnz)));

    // Pass the device pointers to HYPRE (batching everything in a single call)
    HYPRE_IJMatrixSetValues(A, local_n, d_ncols.data(), d_rows.data(), d_cols.data(), d_vals.data());
    HYPRE_IJMatrixAssemble(A);
    
    HYPRE_ParCSRMatrix par_A;
    HYPRE_IJMatrixGetObject(A, (void**)&par_A);

    HYPRE_IJVector b, x;
    HYPRE_IJVectorCreate(MPI_COMM_WORLD, ilower, iupper, &b);
    HYPRE_IJVectorSetObjectType(b, HYPRE_PARCSR);
    HYPRE_IJVectorInitialize(b);

    HYPRE_IJVectorCreate(MPI_COMM_WORLD, ilower, iupper, &x);
    HYPRE_IJVectorSetObjectType(x, HYPRE_PARCSR);
    HYPRE_IJVectorInitialize(x);

    // Create an array of global indices on the GPU
    Kokkos::View<int*> d_idx("d_idx", local_n);
    Kokkos::parallel_for("fill_idx", local_n, KOKKOS_LAMBDA(const int i) {
      d_idx(i) = ilower + i;
    });

    // Create a device view of zeros for the initial guess, x
    Kokkos::View<double*> d_x("d_x", local_n);
    Kokkos::deep_copy(d_x, 0.0);

    // Feed the device views directly to HYPRE
    HYPRE_IJVectorSetValues(b, local_n, d_idx.data(), d_rhs.data());
    HYPRE_IJVectorSetValues(x, local_n, d_idx.data(), d_x.data());

    HYPRE_IJVectorAssemble(b);
    HYPRE_IJVectorAssemble(x);

    HYPRE_ParVector par_b, par_x;
    HYPRE_IJVectorGetObject(b, (void**)&par_b);
    HYPRE_IJVectorGetObject(x, (void**)&par_x);

    HYPRE_Solver solver;
    HYPRE_ParCSRPCGCreate(MPI_COMM_WORLD, &solver);
    HYPRE_PCGSetMaxIter(solver, 200);
    HYPRE_PCGSetTol(solver, 1e-8);
    HYPRE_ParCSRPCGSetup(solver, par_A, par_b, par_x);
    HYPRE_ParCSRPCGSolve(solver, par_A, par_b, par_x);

    int its; double resid;
    HYPRE_PCGGetNumIterations(solver, &its);
    HYPRE_PCGGetFinalRelativeResidualNorm(solver, &resid);
    if (rank == 0) {
      printf("Hypre PCG converged in %d iterations, residual = %e\n", its, resid);
    }

    // Pull the solution back using device views
    Kokkos::View<double*> d_sol("d_sol", local_n);
    HYPRE_IJVectorGetValues(x, local_n, d_idx.data(), d_sol.data());

    double sum = 0.0;
    Kokkos::parallel_reduce("checksum", local_n, KOKKOS_LAMBDA(const int i, double& acc) {
      acc += d_sol(i);
    }, sum);
    printf("Rank %d: sum of local solution values = %f\n", rank, sum);

    HYPRE_ParCSRPCGDestroy(solver);
    HYPRE_IJMatrixDestroy(A);
    HYPRE_IJVectorDestroy(b);
    HYPRE_IJVectorDestroy(x);
    HYPRE_Finalize();
  }
  Kokkos::finalize();
  MPI_Finalize();
  return 0;
}
EOF
```

## 5. Build and Run on the GPU

Configure and build with CMake:

```bash
mkdir -p build && cd build
cmake .. -DKokkos_ROOT="$KOKKOS_DIR" -DHYPRE_DIR="$HYPRE_DIR" -DCMAKE_BUILD_TYPE=Release
cmake --build . -j
```

Run it with two MPI ranks:

```bash
mpirun -n 2 ./dev_demo
```

You should see the Kokkos execution space reported (ideally `Cuda`), a converged Hypre PCG solve, and a checksum printed per rank.

## 6. Iterate Quickly

Change the problem size in `main.cpp`:

```cpp
static const int n = 1000;   // try 100000
```

Rebuild and rerun:

```bash
cmake --build . -j
mpirun -n 2 ./dev_demo
```

## Related E4S Pages

- [HYPRE Quick Start](/quick-start-hypre/)
- [E4S Container Download](/container-download/)
- [E4S Spack Build Cache](/e4s-buildcache/)
- [E4S Product Catalog](/product-catalog/)
- [Frontier E4S Container Demo](/frontier-container-demo/)

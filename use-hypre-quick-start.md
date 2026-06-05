---
layout: single
title: "HYPRE Quick Start"
permalink: /quick-start-hypre/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This quick start walks through a complete beginner workflow:

1. Pull the E4S base container
2. Start an interactive container session
3. Install and load HYPRE with Spack
4. Build and run a simple HYPRE program

{% include e4s-card-style.html %}

{% include e4s-two-card-content.html
   card1_title="Step 1: Pull Container"
   card1_front_text="Download the E4S base image from Docker Hub."
   card1_back_text="Use ecpe4s/e4s-spack-cpu as a portable environment with Spack and MPI."
   card2_title="Step 2: Enter Container"
   card2_front_text="Run the container in interactive mode."
   card2_back_text="Mount a local working directory and get a shell prompt in the container."
%}

{% include e4s-two-card-content.html
   card1_title="Step 3: Install HYPRE"
   card1_front_text="Install and load HYPRE with Spack."
   card1_back_text="Build HYPRE once, then load it into your environment for compile and run."
   card2_title="Step 4: Run Example"
   card2_front_text="Compile and run a minimal HYPRE program."
   card2_back_text="Use mpicc with the HYPRE include and library paths from Spack."
%}

{% include e4s-card-script.html %}

---

## 1. Pull the E4S Base Container

```bash
docker pull ecpe4s/e4s-spack-cpu:latest
```

Optional sanity check:

```bash
docker images ecpe4s/e4s-spack-cpu
```

## 2. Start an Interactive Container Session

Create a local work directory:

```bash
mkdir -p ~/hypre-quickstart
cd ~/hypre-quickstart
```

Start the container and mount your current directory at `/work`:

```bash
docker run -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-spack-cpu:latest
```

You are now inside the container.

## 3. Install and Load HYPRE with Spack

Inside the container, first load MPI:

```bash
spack load mpich
```

Install HYPRE (this can take several minutes):

```bash
spack install hypre +mpi ^mpich
```

Load HYPRE:

```bash
spack load hypre +mpi ^mpich
```

Confirm HYPRE is loaded:

```bash
spack find --loaded
```

Record the install location for compile flags:

```bash
HYPRE_DIR=$(spack location -i hypre)
echo "$HYPRE_DIR"
```

## 4. Build and Run a Tridiagonal HYPRE Solve

Create a file named `hypre_hello.c`.

You can do this with an editor, or directly in the terminal using:

```bash
cat > hypre_hello.c
```

Then paste the following code and press Ctrl-D to save:

```c
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

#include "HYPRE.h"
#include "HYPRE_IJ_mv.h"
#include "HYPRE_parcsr_ls.h"

int main(int argc, char *argv[])
{
  int n = 5;
  if (argc > 1) {
    n = atoi(argv[1]);
  }
  if (n < 2) {
    n = 2;
  }

  MPI_Init(&argc, &argv);

  int rank, nprocs;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    HYPRE_Init();

  /* Partition rows across ranks. */
  int rows_per_rank = n / nprocs;
  int remainder = n % nprocs;
  int local_n = rows_per_rank + (rank < remainder ? 1 : 0);
  int ilower = rank * rows_per_rank + (rank < remainder ? rank : remainder);
  int iupper = ilower + local_n - 1;

  HYPRE_IJMatrix A;
  HYPRE_IJMatrixCreate(MPI_COMM_WORLD, ilower, iupper, ilower, iupper, &A);
  HYPRE_IJMatrixSetObjectType(A, HYPRE_PARCSR);
  HYPRE_IJMatrixInitialize(A);

  for (int i = ilower; i <= iupper; i++) {
    int cols[3];
    double vals[3];
    int ncols = 0;

    if (i - 1 >= 0) {
      cols[ncols] = i - 1;
      vals[ncols] = -1.0;
      ncols++;
    }

    cols[ncols] = i;
    vals[ncols] = 2.0;
    ncols++;

    if (i + 1 < n) {
      cols[ncols] = i + 1;
      vals[ncols] = -1.0;
      ncols++;
    }

    int row = i;
    HYPRE_IJMatrixSetValues(A, 1, &ncols, &row, cols, vals);
  }

  HYPRE_IJMatrixAssemble(A);
  HYPRE_ParCSRMatrix par_A;
  HYPRE_IJMatrixGetObject(A, (void **) &par_A);

  HYPRE_IJVector b;
  HYPRE_IJVectorCreate(MPI_COMM_WORLD, ilower, iupper, &b);
  HYPRE_IJVectorSetObjectType(b, HYPRE_PARCSR);
  HYPRE_IJVectorInitialize(b);

  HYPRE_IJVector x;
  HYPRE_IJVectorCreate(MPI_COMM_WORLD, ilower, iupper, &x);
  HYPRE_IJVectorSetObjectType(x, HYPRE_PARCSR);
  HYPRE_IJVectorInitialize(x);

  for (int i = ilower; i <= iupper; i++) {
    int idx = i;
    double bval = 1.0;
    double xval = 0.0;
    HYPRE_IJVectorSetValues(b, 1, &idx, &bval);
    HYPRE_IJVectorSetValues(x, 1, &idx, &xval);
  }

  HYPRE_IJVectorAssemble(b);
  HYPRE_IJVectorAssemble(x);

  HYPRE_ParVector par_b;
  HYPRE_ParVector par_x;
  HYPRE_IJVectorGetObject(b, (void **) &par_b);
  HYPRE_IJVectorGetObject(x, (void **) &par_x);

  HYPRE_Solver solver;
  HYPRE_Solver precond;

  HYPRE_ParCSRPCGCreate(MPI_COMM_WORLD, &solver);
  HYPRE_PCGSetMaxIter(solver, 100);
  HYPRE_PCGSetTol(solver, 1.0e-10);
  HYPRE_PCGSetPrintLevel(solver, 2);

  HYPRE_BoomerAMGCreate(&precond);
  HYPRE_BoomerAMGSetPrintLevel(precond, 0);
  HYPRE_BoomerAMGSetCoarsenType(precond, 6);
  HYPRE_BoomerAMGSetRelaxType(precond, 6);
  HYPRE_BoomerAMGSetNumSweeps(precond, 1);

  HYPRE_ParCSRPCGSetPrecond(
    solver,
    (HYPRE_PtrToParSolverFcn) HYPRE_BoomerAMGSolve,
    (HYPRE_PtrToParSolverFcn) HYPRE_BoomerAMGSetup,
    precond);

  HYPRE_ParCSRPCGSetup(solver, par_A, par_b, par_x);
  HYPRE_ParCSRPCGSolve(solver, par_A, par_b, par_x);

  int num_iterations = 0;
  double final_res_norm = 0.0;
  HYPRE_PCGGetNumIterations(solver, &num_iterations);
  HYPRE_PCGGetFinalRelativeResidualNorm(solver, &final_res_norm);

  if (rank == 0) {
    printf("Solved 1D tridiagonal system with n = %d\n", n);
    printf("Iterations: %d\n", num_iterations);
    printf("Final relative residual norm: %.6e\n", final_res_norm);
  }

  for (int i = ilower; i <= iupper; i++) {
    int idx = i;
    double xval = 0.0;
    HYPRE_IJVectorGetValues(x, 1, &idx, &xval);
    if (rank == 0) {
      printf("x[%d] = %.12f\n", i, xval);
    }
  }

  HYPRE_ParCSRPCGDestroy(solver);
  HYPRE_BoomerAMGDestroy(precond);
  HYPRE_IJVectorDestroy(x);
  HYPRE_IJVectorDestroy(b);
  HYPRE_IJMatrixDestroy(A);

    HYPRE_Finalize();
  MPI_Finalize();
    return 0;
}
```

Select the HYPRE library directory (`lib` or `lib64`):

```bash
if [ -d "$HYPRE_DIR/lib64" ]; then
  HYPRE_LIBDIR="$HYPRE_DIR/lib64"
else
  HYPRE_LIBDIR="$HYPRE_DIR/lib"
fi
echo "$HYPRE_LIBDIR"
```

Compile the program with an embedded runtime library path (rpath):

```bash
mpicc -O2 hypre_hello.c -o hypre_hello \
  -I"$HYPRE_DIR/include" \
  -L"$HYPRE_LIBDIR" -Wl,-rpath,"$HYPRE_LIBDIR" -lHYPRE -lm
```

If you already compiled without rpath and see a `libHYPRE` runtime error, set:

```bash
export LD_LIBRARY_PATH="$HYPRE_LIBDIR:$LD_LIBRARY_PATH"
```

Run with one MPI rank and the example size `n = 5`:

```bash
mpirun -n 1 ./hypre_hello 5
```

To change problem size, pass a different `n` value (for example, 20):

```bash
mpirun -n 1 ./hypre_hello 20
```

Expected output includes lines like:

```text
Solved 1D tridiagonal system with n = 5
Iterations: ...
Final relative residual norm: ...
x[0] = ...
```

## What You Learned

- How to use an E4S base container for a reproducible environment
- How to install and load HYPRE with Spack
- How to compile and run a HYPRE linear solver example

Next, you can extend this by changing the right-hand side, trying larger `n`, or running with multiple MPI ranks.

---
layout: single
title: "Frontier E4S Container Demo"
permalink: /frontier-container-demo/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

# Frontier E4S container demo

This example demonstrates a realistic E4S workflow on OLCF Frontier using the ROCm-enabled E4S container image. The goal is to show how to:

- fetch a prebuilt E4S Apptainer/Singularity image into a scratch area,
- build and run a small example inside the container using Spack provided software,
- allocate a GPU job on Frontier,
- and execute a real GPU application from the container environment.

This is a good fit for users who want to prototype GPU workloads on Frontier without maintaining a separate host build environment for every dependency.

## Prerequisites

Before starting, make sure you are logged into Frontier with a valid project allocation and that the standard OLCF environment is active. A typical workflow uses the container and MPI modules that are already provided by the system.

The commands below assume you have a project allocation and the ability to write to a scratch area under `$MEMBERWORK`.

## 1) Download the E4S ROCm image to scratch

Use a scratch directory under `$MEMBERWORK` so the image is stored on a location appropriate for large temporary data.

```bash
mkdir -p ${MEMBERWORK}/e4s-demo
cd ${MEMBERWORK}/e4s-demo

wget https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm90a-x86_64-26.06.sif
ls -lh e4s-rocm90a-x86_64-26.06.sif
```

This image is approximately 24 GB and may take around 20 minutes to download, depending on network conditions.

> There is also a CPU-only E4S image for MPI/thread-oriented workloads that do not rely on GPU-accelerated software. This ROCm image is the right choice for the GPU benchmark shown here. Other ROCm images are available for different GPU hardware versions.

## 2) Build a PETSc example inside the container

This step uses the container to source Spack, load a package, and compile a small PETSc example.

```bash
cd ${MEMBERWORK}/e4s-demo

apptainer exec --rocm e4s-rocm90a-x86_64-26.06.sif bash -c '
  source /spack/share/spack/setup-env.sh 2>/dev/null || true
  spack load petsc
  PETSC_DIR=$(spack location -i petsc)
  cp ${PETSC_DIR}/share/petsc/examples/src/snes/tutorials/ex19.c .
  cp ${PETSC_DIR}/share/petsc/examples/src/snes/tutorials/makefile .
  make ex19
'
```

This compiles a representative example from PETSc into the working directory inside the container. Critically, the build is executed within the container environment where the correct Spack packages and toolchain are already set up.

## 3) Request an allocation on Frontier

Use `salloc` to reserve compute resources before running the actual GPU workload.

```bash
salloc -A <project_id> -N 1 -t 60 -q batch
```

Once the allocation is active, move back into the demo directory and load the container support modules needed for GPU-aware containerized execution.

```bash
cd ${MEMBERWORK}/e4s-demo
module load apptainer-enable-gpu apptainer-enable-mpi
```

## 4) Run the workload in the container

The final step uses a single node with 8 tasks and one GPU per task. This matches the Frontier GPU setup and launches the benchmark inside the E4S container with the correct MPI and ROCm configuration.

```bash
srun -N 1 -n 8 --ntasks-per-node=8 --gpus-per-task=1 --gpu-bind=closest --mpi=pmi2 \
  apptainer exec --rocm e4s-rocm90a-x86_64-26.06.sif \
    bash -c "source /spack/share/spack/setup-env.sh && spack load slate && unset CUDA_VISIBLE_DEVICES HIP_VISIBLE_DEVICES; slate_tester --origin d --target d --dim 10240 --nb 512 gemm"
```

This command is intentionally simple to illustrate the overall pattern:

- the image is launched with ROCm support enabled,
- the Spack environment is loaded inside the container,
- and the GPU benchmark runs with the container-resident BLAS/LAPACK stack and host MPI/GPU scheduling.

## Why this workflow matters

This demonstration shows an E4S usage pattern that is common on HPC systems:

- container images provide a known-good scientific software stack,
- Spack within the container resolves dependencies consistently,
- and the host scheduler still controls the job placement and GPU assignments.

That combination makes it easier to reproduce performance studies and to run complex GPU software stacks without rebuilding a full environment on the host.

## Related E4S container pages

For additional container guidance and broader installation patterns, see:

- [E4S Container Installation](/container-installation/)
- [E4S Container Launch](/container-launch/)
- [Test with E4S](/test-with-e4s/)

Please contact the E4S team if you want help adapting this workflow to a different machine, MPI stack, or benchmark.

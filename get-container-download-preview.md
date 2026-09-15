---
layout: single
title: "E4S Container Download (Preview)"
permalink: /container-download-preview/
classes: wide
sidebar:
  nav: "getmenu"
sitemap: false
---


<div style="border: 2px solid #b08800; background: #fff8e1; color: #6b5300; padding: 1em 1.25em; border-radius: 6px; margin-bottom: 1.5em;">
<strong>Draft preview — not the live page.</strong> This is a proposed reorganization of the <a href="/container-download/">E4S Container Download</a> page. Revision 5 removes the "Docker vs. Singularity/Apptainer" explainer box. Earlier revisions renamed "Minimal Spack" to <strong>Cache-backed Images (CBIs)</strong> — the new branding — with its section now just noting that any E4S product can be installed and loaded straight from the cache these images already point to, with no setup instructions; the main table also notes that each Docker column entry is a ready-to-pull <code>image:tag</code> reference. The page separates <strong>ready-to-use release images</strong> (E4S Full Release Images, Cache-backed Images) from <strong>developer &amp; build images</strong> (GPU base images, CI runners, project-specific images) that exist mainly to support E4S development. It is for internal review only, is not linked from site navigation, and the official page at <code>/container-download/</code> is unaffected.
</div>

{% include e4s-page-actions.html %}

### Acquiring E4S Containers

The current E4S container offerings include Docker and Singularity images capable of running on X86_64, PPC64LE, and AARCH64 architectures. Our full E4S Release images are based on Ubuntu 24.04 and Rocky 9 (x86_64, aarch64, ppc64le). In addition to offering a full E4S image containing a comprehensive selection of E4S software released on a bi-annual cycle, we also offer a set of minimal base images suitable for use in Continuous Integration (CI) pipelines where Spack is used to build packages.

Docker images are available on the [E4S Docker Hub](https://hub.docker.com/u/ecpe4s).
Please see the [E4S 26.06 Release Notes](https://oaciss.uoregon.edu/e4s/talks/E4S_26.06.pdf).

-----

## Ready-to-Use Release Images

<div style="border: 1px solid #a9d1ab; background: #eef7ee; color: #235026; padding: 1em 1.25em; border-radius: 6px; margin: 1em 0 1.5em;">
These are E4S's public-facing products: complete, tested deployments you can pull and use directly. No additional Spack build is required.
</div>

### E4S Full Release Images

These images contain a full Spack-based deployment of E4S. The CUDA, ROCm, and OneAPI variants add GPU-enabled packages for NVIDIA, AMD, and Intel GPUs, respectively, and also include NVIDIA NeMo, NVIDIA BioNeMo, VLLM, PyTorch, TensorFlow, and TAU, where appropriate.

| Variant | Architecture | OS | Docker | Singularity | Description |
|---|---|---|---|---|---|
| CPU only | x86_64 | Ubuntu | [`ecpe4s/e4s-cpu:26.06`](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-x86_64-26.06.sif) | Full E4S release with CPU-only packages |
| CPU only | aarch64 | Ubuntu | [`ecpe4s/e4s-cpu:26.06`](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-aarch64-26.06.sif) | Full E4S release with CPU-only packages |
| CPU only | x86_64 | Rocky | [`ecpe4s/e4s-cpu-rocky:26.06`](https://hub.docker.com/r/ecpe4s/e4s-cpu-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-rocky-x86_64-26.06.sif) | Full E4S release with CPU-only packages |
| CPU only | aarch64 | Rocky | [`ecpe4s/e4s-cpu-rocky:26.06`](https://hub.docker.com/r/ecpe4s/e4s-cpu-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-rocky-aarch64-26.06.sif) | Full E4S release with CPU-only packages |
| CUDA (Volta, cuda70) | ppc64le | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda70`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda70-ppc64le-26.06.sif) | NVIDIA CUDA support for Volta-generation GPUs (e.g., V100) |
| CUDA (Ampere, cuda80) | x86_64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda80`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-x86_64-26.06.sif) | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100) |
| CUDA (Ampere, cuda80) | aarch64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda80`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-aarch64-26.06.sif) | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100) |
| CUDA (Hopper, cuda90) | x86_64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda90`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-x86_64-26.06.sif) | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) |
| CUDA (Hopper, cuda90) | aarch64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda90`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-aarch64-26.06.sif) | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) |
| CUDA (Hopper, cuda90) | x86_64 | Rocky | [`ecpe4s/e4s-cuda-rocky:26.06-cuda90`](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-x86_64-26.06.sif) | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) |
| CUDA (Hopper, cuda90) | aarch64 | Rocky | [`ecpe4s/e4s-cuda-rocky:26.06-cuda90`](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-aarch64-26.06.sif) | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) |
| CUDA (Blackwell, cuda120) | x86_64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda120`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-x86_64-26.06.sif) | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) |
| CUDA (Blackwell, cuda120) | aarch64 | Ubuntu | [`ecpe4s/e4s-cuda:26.06-cuda120`](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-aarch64-26.06.sif) | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) |
| CUDA (Blackwell, cuda120) | x86_64 | Rocky | [`ecpe4s/e4s-cuda-rocky:26.06-cuda120`](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-x86_64-26.06.sif) | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) |
| CUDA (Blackwell, cuda120) | aarch64 | Rocky | [`ecpe4s/e4s-cuda-rocky:26.06-cuda120`](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-aarch64-26.06.sif) | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) |
| ROCm gfx908 (MI100) | x86_64 | Ubuntu | [`ecpe4s/e4s-rocm:26.06-rocm908`](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm908-x86_64-26.06.sif) | AMD ROCm support for MI100-series GPUs |
| ROCm gfx90a (MI200) | x86_64 | Ubuntu | [`ecpe4s/e4s-rocm:26.06-rocm90a`](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm90a-x86_64-26.06.sif) | AMD ROCm support for MI200-series GPUs |
| ROCm gfx942 (MI300) | x86_64 | Ubuntu | [`ecpe4s/e4s-rocm:26.06-rocm942`](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm942-x86_64-26.06.sif) | AMD ROCm support for MI300-series GPUs |
| OneAPI | x86_64 | Ubuntu | [`ecpe4s/e4s-oneapi:26.06`](https://hub.docker.com/r/ecpe4s/e4s-oneapi/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-oneapi-x86_64-26.06.sif) | Full E4S release with Intel OneAPI GPU support |

Each entry in the Docker column (e.g. `ecpe4s/e4s-cuda:26.06-cuda80`) is a complete, ready-to-use image reference — run `docker pull` on it directly, no need to click through first: `docker pull ecpe4s/e4s-cuda:26.06-cuda80`. The link itself goes to that repository's tag list rather than a single tag's page, since Docker Hub doesn't offer a reliable deep link to one tag; it's there for browsing, not required for the pull. The same applies to every Docker column on this page.

<!-- * [OVA Download](http://tau.uoregon.edu/ecp.ova) -->

-----

### Cache-backed Images (CBIs)

These images provide a minimal Spack Core v1.1.1 environment (with GNU and/or CUDA/ROCm/OneAPI compilers) that's already pointed at the E4S binary cache. Any E4S product can be installed and loaded directly from the cache — no separate cache setup needed. See [Use the E4S Spack Build Cache](/e4s-buildcache/) for more on the cache itself.

| Compilers | Architecture | Docker | Singularity | Description |
|---|---|---|---|---|
| GNU | x86_64 | [`ecpe4s/e4s-spack-cpu`](https://hub.docker.com/r/ecpe4s/e4s-spack-cpu/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-x86_64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU compilers |
| GNU | aarch64 | [`ecpe4s/e4s-spack-cpu`](https://hub.docker.com/r/ecpe4s/e4s-spack-cpu/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-aarch64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU compilers |
| GNU | ppc64le | [`ecpe4s/e4s-spack-cpu`](https://hub.docker.com/r/ecpe4s/e4s-spack-cpu/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-ppc64le-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU compilers |
| GNU + NVIDIA CUDA | x86_64 | [`ecpe4s/e4s-spack-cuda`](https://hub.docker.com/r/ecpe4s/e4s-spack-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-x86_64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers |
| GNU + NVIDIA CUDA | aarch64 | [`ecpe4s/e4s-spack-cuda`](https://hub.docker.com/r/ecpe4s/e4s-spack-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-aarch64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers |
| GNU + NVIDIA CUDA | ppc64le | [`ecpe4s/e4s-spack-cuda`](https://hub.docker.com/r/ecpe4s/e4s-spack-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-ppc64le-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers |
| GNU + AMD ROCm | x86_64 | [`ecpe4s/e4s-spack-rocm`](https://hub.docker.com/r/ecpe4s/e4s-spack-rocm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-rocm-x86_64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU and AMD ROCm compilers |
| GNU + Intel OneAPI | x86_64 | [`ecpe4s/e4s-spack-oneapi`](https://hub.docker.com/r/ecpe4s/e4s-spack-oneapi/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-oneapi-x86_64-26-06.sif) | Cache-backed Spack Core v1.1.1 environment with GNU and Intel OneAPI compilers |

-----

### E4S Facility Deployment

  * [NERSC](https://docs.nersc.gov/applications/e4s/)
  * [OLCF](https://docs.olcf.ornl.gov/software/e4s.html)

-----

### AWS EC2 Image

The E4S 26.06 release is also available on [AWS](http://aws.amazon.com/) as an EC2 AMI with ID ami-0e752117cfa13cb9b in the US-West-2 (Oregon) region.

-----

## Developer & Build Images

<div style="border: 1px solid #cfcfcf; background: #f4f4f4; color: #3a3a3a; padding: 1em 1.25em; border-radius: 6px; margin: 1em 0 1.5em;">
Everything below is published openly as part of E4S's open development process, but these are <strong>not</strong> ready-to-use science images — they're minimal SDK/toolchain base images, CI runners, and project-specific build environments that E4S developers use to build, test, and package E4S itself. Anyone is welcome to use them, but expect to need your own Spack build or additional setup on top.
</div>

### GPU Base Images

These images come with MPICH, CMake, and the relevant GPU SDK -- either AMD ROCm, NVIDIA CUDA Toolkit and NVHPC, or Intel OneAPI.

| SDK | Architecture | Docker | Singularity | Description |
|---|---|---|---|---|
| AMD ROCm | x86_64 | [`ecpe4s/e4s-base-rocm:26.06`](https://hub.docker.com/r/ecpe4s/e4s-base-rocm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-rocm-26-06.sif) | Minimal base image with MPICH, CMake, and the AMD ROCm SDK |
| NVIDIA CUDA | x86_64 | [`ecpe4s/e4s-base-cuda:26.06`](https://hub.docker.com/r/ecpe4s/e4s-base-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-x86_64-26-06.sif) | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC |
| NVIDIA CUDA | aarch64 | [`ecpe4s/e4s-base-cuda:26.06`](https://hub.docker.com/r/ecpe4s/e4s-base-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-aarch64-26-06.sif) | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC |
| NVIDIA CUDA | ppc64le | [`ecpe4s/e4s-base-cuda:26.06`](https://hub.docker.com/r/ecpe4s/e4s-base-cuda/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-ppc64le-26-06.sif) | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC |
| Intel OneAPI | x86_64 | [`ecpe4s/e4s-base-oneapi:26.06`](https://hub.docker.com/r/ecpe4s/e4s-base-oneapi/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-oneapi-26-06.sif) | Minimal base image with MPICH, CMake, and the Intel OneAPI SDK |

-----

### DOE LLVM E4S Image

This multi-architecture image contains E4S products compiled with DOE LLVM 16 and Flang using Spack

| Architecture | Docker | Singularity | Description |
|---|---|---|---|
| x86_64 | [`ecpe4s/e4s-doe-llvm:23.05`](https://hub.docker.com/r/ecpe4s/e4s-doe-llvm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-x86_64-23.05.sif) | E4S products compiled with DOE LLVM 16 and Flang |
| aarch64 | [`ecpe4s/e4s-doe-llvm:23.05`](https://hub.docker.com/r/ecpe4s/e4s-doe-llvm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-aarch64-23.05.sif) | E4S products compiled with DOE LLVM 16 and Flang |
| ppc64le | [`ecpe4s/e4s-doe-llvm:23.05`](https://hub.docker.com/r/ecpe4s/e4s-doe-llvm/tags) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-ppc64le-23.05.sif) | E4S products compiled with DOE LLVM 16 and Flang |

-----

### Application-Specific Continuous Integration Images

| Image | Description | Download |
|---|---|---|
| ecpe4s/sollve-rocm6.3.0 | SOLLVE CI image built with AMD ROCm 6.3.0 | [docker](https://hub.docker.com/r/ecpe4s/sollve-rocm6.3.0/tags) |
| ecpe4s/sollve-cuda12.6.3-arm64 | SOLLVE CI image built with NVIDIA CUDA 12.6.3, arm64 | [docker](https://hub.docker.com/r/ecpe4s/sollve-cuda12.6.3-arm64/tags) |
| ecpe4s/sollve-cuda12.6.3-amd64 | SOLLVE CI image built with NVIDIA CUDA 12.6.3, amd64 | [docker](https://hub.docker.com/r/ecpe4s/sollve-cuda12.6.3-amd64/tags) |
| ecpe4s/trilinos-sycl | Trilinos CI image built with Intel OneAPI SYCL/DPC++ | [docker](https://hub.docker.com/r/ecpe4s/trilinos-sycl/tags) |
| ecpe4s/trilinos-ci-rocm6.2.1 | Trilinos CI image built with AMD ROCm 6.2.1 | [docker](https://hub.docker.com/r/ecpe4s/trilinos-ci-rocm6.2.1/tags) |
| ecpe4s/trilinos-ci-cuda12.2.2 | Trilinos CI image built with NVIDIA CUDA 12.2.2 | [docker](https://hub.docker.com/r/ecpe4s/trilinos-ci-cuda12.2.2/tags) |
| ecpe4s/trilinos-ci-arm64-cuda12 | Trilinos CI image built with NVIDIA CUDA 12, arm64 | [docker](https://hub.docker.com/r/ecpe4s/trilinos-ci-arm64-cuda12/tags) |
| ecpe4s/exawind-snapshot | ExaWind CI image with a snapshot build of the ExaWind software stack | [docker](https://hub.docker.com/r/ecpe4s/exawind-snapshot/tags) |
| ecpe4s/exago-cuda80 | ExaGO CI image built with NVIDIA CUDA for Ampere-generation GPUs (e.g., A100) | [docker](https://hub.docker.com/r/ecpe4s/exago-cuda80/tags) |
| ecpe4s/exago-rocm90a | ExaGO CI image built with AMD ROCm for MI200-series GPUs | [docker](https://hub.docker.com/r/ecpe4s/exago-rocm90a/tags) |

### Minimal Continuous Integration Images

##### X86\_64

| Image | Description | Download |
|---|---|---|
| ecpe4s/ubuntu24.04-runner-x86_64-gcc-13.3 | Minimal Ubuntu 24.04 CI runner with GCC 13.3, x86_64 | [docker](https://hub.docker.com/r/ecpe4s/ubuntu24.04-runner-x86_64-gcc-13.3/tags) |
| ecpe4s/rocky9-runner-x86_64-gcc-13.3 | Minimal Rocky Linux 9 CI runner with GCC 13.3, x86_64 | [docker](https://hub.docker.com/r/ecpe4s/rocky9-runner-x86_64-gcc-13.3/tags) |


##### PPC64LE

| Image | Description | Download |
|---|---|---|
| ecpe4s/ubuntu20.04-runner-ppc64le-gcc-11.4 | Minimal Ubuntu 20.04 CI runner with GCC 11.4, ppc64le | [docker](https://hub.docker.com/r/ecpe4s/ubuntu20.04-runner-ppc64le-gcc-11.4/tags) |


##### AARCH64

| Image | Description | Download |
|---|---|---|
| ecpe4s/ubuntu24.04-runner-aarch64-gcc-13.3 | Minimal Ubuntu 24.04 CI runner with GCC 13.3, aarch64 | [docker](https://hub.docker.com/r/ecpe4s/ubuntu24.04-runner-aarch64-gcc-13.3/tags) |
| ecpe4s/rocky9-runner-aarch64-gcc-13.3 | Minimal Rocky Linux 9 CI runner with GCC 13.3, aarch64 | [docker](https://hub.docker.com/r/ecpe4s/rocky9-runner-aarch64-gcc-13.3/tags) |


-----

### Custom Images

| Image | Description | Download |
|---|---|---|
| ecpe4s/waggle-ml | Custom image for the Waggle edge-computing/machine-learning platform | [docker](https://hub.docker.com/r/ecpe4s/waggle-ml/tags) |
| ecpe4s/exawind-snapshot | Snapshot build of the ExaWind software stack | [docker](https://hub.docker.com/r/ecpe4s/exawind-snapshot/tags) |
| ecpe4s/superlu\_sc | Custom image built for SuperLU Supercomputing (SC) conference demos | [docker](https://hub.docker.com/r/ecpe4s/superlu_sc/tags) |

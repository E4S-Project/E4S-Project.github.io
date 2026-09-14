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
<strong>Draft preview — not the live page.</strong> This is a proposed reorganization of the <a href="/container-download/">E4S Container Download</a> page (bullet lists converted to scannable tables, with a new Description column). It is for internal review only and is not linked from site navigation. The official page at <code>/container-download/</code> is unaffected.
</div>

{% include e4s-page-actions.html %}

### Acquiring E4S Containers

The current E4S container offerings include Docker and Singularity images capable of running on X86_64, PPC64LE, and AARCH64 architectures. Our full E4S Release images are based on Ubuntu 24.04 and Rocky 9 (x86_64, aarch64, ppc64le). In addition to offering a full E4S image containing a comprehensive selection of E4S software released on a bi-annual cycle, we also offer a set of minimal base images suitable for use in Continuous Integration (CI) pipelines where Spack is used to build packages.

Docker images are available on the [E4S Docker Hub](https://hub.docker.com/u/ecpe4s).
Please see the [E4S 26.06 Release Notes](https://oaciss.uoregon.edu/e4s/talks/E4S_26.06.pdf).


-----

### Container Releases

**Docker**

| Variant | OS | Description | Download |
|---|---|---|---|
| Minimal | – | Minimal Spack build environment for CI pipelines | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-spack-cpu/tags) |
| CPU only | Ubuntu | Full E4S release with CPU-only packages | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags) |
| CPU only | Rocky | Full E4S release with CPU-only packages | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-cpu-rocky/tags) |
| CUDA | Ubuntu | Full E4S release with NVIDIA CUDA GPU support | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) |
| CUDA | Rocky | Full E4S release with NVIDIA CUDA GPU support | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky/tags) |
| ROCm | – | Full E4S release with AMD ROCm GPU support | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags) |
| OneAPI | – | Full E4S release with Intel OneAPI GPU support | [Docker Hub](https://hub.docker.com/r/ecpe4s/e4s-oneapi/tags) |

**Singularity**

| Architecture | Variant | OS | Description | Download |
|---|---|---|---|---|
| x86_64 | Minimal | – | Minimal Spack build environment for CI pipelines | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-x86_64-26-06.sif) |
| x86_64 | CPU only | Ubuntu | Full E4S release with CPU-only packages | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-x86_64-26.06.sif) |
| x86_64 | CPU only | Rocky | Full E4S release with CPU-only packages | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-rocky-x86_64-26.06.sif) |
| x86_64 | CUDA 80 | Ubuntu | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-x86_64-26.06.sif) |
| x86_64 | CUDA 90 | Ubuntu | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-x86_64-26.06.sif) |
| x86_64 | CUDA 90 | Rocky | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-x86_64-26.06.sif) |
| x86_64 | CUDA 120 | Ubuntu | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-x86_64-26.06.sif) |
| x86_64 | CUDA 120 | Rocky | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-x86_64-26.06.sif) |
| x86_64 | ROCm gfx942 | Ubuntu | AMD ROCm support for MI300-series GPUs | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm942-x86_64-26.06.sif) |
| x86_64 | ROCm gfx90a | Ubuntu | AMD ROCm support for MI200-series GPUs | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm90a-x86_64-26.06.sif) |
| x86_64 | ROCm gfx908 | Ubuntu | AMD ROCm support for MI100-series GPUs | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm908-x86_64-26.06.sif) |
| x86_64 | OneAPI | Ubuntu | Full E4S release with Intel OneAPI GPU support | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-oneapi-x86_64-26.06.sif) |
| ppc64le | CUDA 70 | Ubuntu | NVIDIA CUDA support for Volta-generation GPUs (e.g., V100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda70-ppc64le-26.06.sif) |
| aarch64 | CPU only | Ubuntu | Full E4S release with CPU-only packages | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-aarch64-26.06.sif) |
| aarch64 | CUDA 80 | Ubuntu | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-aarch64-26.06.sif) |
| aarch64 | CUDA 90 | Ubuntu | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-aarch64-26.06.sif) |
| aarch64 | CUDA 90 | Rocky | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-aarch64-26.06.sif) |
| aarch64 | CUDA 120 | Ubuntu | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-aarch64-26.06.sif) |
| aarch64 | CUDA 120 | Rocky | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0) | [Download](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-aarch64-26.06.sif) |

<!-- * [OVA Download](http://tau.uoregon.edu/ecp.ova) -->

-----


### Note on Container Images

Container images contain binary versions of the Full Release packages listed above. Full-featured GPU-enabled container images are available from Dockerhub:

```bash
# docker pull ecpe4s/e4s-cuda:26.06-cuda120
# docker pull ecpe4s/e4s-cuda:26.06-cuda90
# docker pull ecpe4s/e4s-cuda:26.06-cuda80
# docker pull ecpe4s/e4s-cuda:26.06-cuda70
# docker pull ecpe4s/e4s-cuda-rocky:26.06-cuda120
# docker pull ecpe4s/e4s-cuda-rocky:26.06-cuda90
# docker pull ecpe4s/e4s-rocm:26.06-rocm942
# docker pull ecpe4s/e4s-rocm:26.06-rocm90a
# docker pull ecpe4s/e4s-rocm:26.06-rocm908
# docker pull ecpe4s/e4s-oneapi:26.06
# docker pull ecpe4s/e4s-cpu:26.06
# docker pull ecpe4s/e4s-cpu-rocky:26.06
```

### E4S Full GPU Images

These images contain a full Spack-based deployment of E4S, including GPU-enabled packages for NVIDIA, AMD, or Intel GPUs.

These images also contain NVIDIA NeMo, NVIDIA BioNeMo, VLLM, PyTorch, TensorFlow, and TAU, where appropriate. 

##### AMD ROCm (x86\_64)

| Format | Image | Description | Download |
|---|---|---|---|
| Docker | ecpe4s/e4s-rocm:26.06 | Full E4S release with AMD ROCm GPU support (all supported AMD GPU targets) | [docker](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags) |
| Singularity | e4s-rocm942-x86\_64-26.06.sif | AMD ROCm support for MI300-series GPUs | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm942-x86_64-26.06.sif) |
| Singularity | e4s-rocm90a-x86\_64-26.06.sif | AMD ROCm support for MI200-series GPUs | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm90a-x86_64-26.06.sif) |
| Singularity | e4s-rocm908-x86\_64-26.06.sif | AMD ROCm support for MI100-series GPUs | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-rocm908-x86_64-26.06.sif) |

##### NVIDIA CUDA (X86\_64, PPC64LE, AARCH64)

| Format | Architecture | Image | Description | Download |
|---|---|---|---|---|
| Docker | Multi-arch | ecpe4s/e4s-cuda:26.06 | Full E4S release with NVIDIA CUDA GPU support (all supported NVIDIA GPU targets) | [docker](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags) |
| Singularity | x86_64 | e4s-cuda80-x86\_64-26.06.sif | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-x86_64-26.06.sif) |
| Singularity | x86_64 | e4s-cuda90-x86\_64-26.06.sif | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-x86_64-26.06.sif) |
| Singularity | x86_64 | e4s-cuda120-x86\_64-26.06.sif | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-x86_64-26.06.sif) |
| Singularity | x86_64 | e4s-cuda90-rocky-x86\_64-26.06.sif | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100), Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-x86_64-26.06.sif) |
| Singularity | x86_64 | e4s-cuda120-rocky-x86\_64-26.06.sif | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0), Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-x86_64-26.06.sif) |
| Singularity | ppc64le | e4s-cuda70-ppc64le-26.06.sif | NVIDIA CUDA support for Volta-generation GPUs (e.g., V100), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda70-ppc64le-26.06.sif) |
| Singularity | aarch64 | e4s-cuda80-aarch64-26.06.sif | NVIDIA CUDA support for Ampere-generation GPUs (e.g., A100), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda80-aarch64-26.06.sif) |
| Singularity | aarch64 | e4s-cuda90-aarch64-26.06.sif | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-aarch64-26.06.sif) |
| Singularity | aarch64 | e4s-cuda120-aarch64-26.06.sif | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0), Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-aarch64-26.06.sif) |
| Singularity | aarch64 | e4s-cuda90-rocky-aarch64-26.06.sif | NVIDIA CUDA support for Hopper-generation GPUs (e.g., H100), Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda90-rocky-aarch64-26.06.sif) |
| Singularity | aarch64 | e4s-cuda120-rocky-aarch64-26.06.sif | NVIDIA CUDA support for Blackwell-generation GPUs (compute capability 12.0), Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cuda120-rocky-aarch64-26.06.sif) |

##### Intel OneAPI (x86\_64)

| Format | Image | Description | Download |
|---|---|---|---|
| Docker | ecpe4s/e4s-oneapi:26.06 | Full E4S release with Intel OneAPI GPU support | [docker](https://hub.docker.com/r/ecpe4s/e4s-oneapi/tags) |
| Singularity | e4s-oneapi-x86\_64-26.06.sif | Full E4S release with Intel OneAPI GPU support | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-oneapi-x86_64-26.06.sif) |

##### CPU-only (x86\_64, aarch64)

| Format | Architecture | Image | Description | Download |
|---|---|---|---|---|
| Docker | Multi-arch | ecpe4s/e4s-cpu:26.06 | Full E4S release with CPU-only packages (x86_64 and aarch64) | [docker](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags) |
| Singularity | x86_64 | e4s-cpu-x86\_64-26.06.sif | Full E4S release with CPU-only packages, Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-x86_64-26.06.sif) |
| Singularity | x86_64 | e4s-cpu-rocky-x86\_64-26.06.sif | Full E4S release with CPU-only packages, Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-rocky-x86_64-26.06.sif) |
| Singularity | aarch64 | e4s-cpu-aarch64-26.06.sif | Full E4S release with CPU-only packages, Ubuntu | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-aarch64-26.06.sif) |
| Singularity | aarch64 | e4s-cpu-rocky-aarch64-26.06.sif | Full E4S release with CPU-only packages, Rocky | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-cpu-rocky-aarch64-26.06.sif) |

-----

### GPU Base Images

These images come with MPICH, CMake, and the relevant GPU SDK -- either AMD ROCm, NVIDIA CUDA Toolkit and NVHPC, or Intel OneAPI.

##### AMD ROCM (X86\_64)

| Format | Image | Description | Download |
|---|---|---|---|
| Docker | ecpe4s/e4s-base-rocm:26.06 | Minimal base image with MPICH, CMake, and the AMD ROCm SDK | [docker](https://hub.docker.com/r/ecpe4s/e4s-base-rocm/tags) |
| Singularity | e4s-base-rocm-26-06.sif | Minimal base image with MPICH, CMake, and the AMD ROCm SDK | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-rocm-26-06.sif) |

##### NVIDIA Multi-Arch (X86\_64, PPC64LE, AARCH64)

| Format | Architecture | Image | Description | Download |
|---|---|---|---|---|
| Docker | Multi-arch | ecpe4s/e4s-base-cuda:26.06 | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC | [docker](https://hub.docker.com/r/ecpe4s/e4s-base-cuda/tags) |
| Singularity | x86_64 | e4s-base-cuda-x86\_64-26-06.sif | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-x86_64-26-06.sif) |
| Singularity | aarch64 | e4s-base-cuda-aarch64-26-06.sif | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-aarch64-26-06.sif) |
| Singularity | ppc64le | e4s-base-cuda-ppc64le-26-06.sif | Minimal base image with MPICH, CMake, and the NVIDIA CUDA Toolkit/NVHPC | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-cuda-ppc64le-26-06.sif) |

##### Intel OneAPI (X86\_64)

| Format | Image | Description | Download |
|---|---|---|---|
| Docker | ecpe4s/e4s-base-oneapi:26.06 | Minimal base image with MPICH, CMake, and the Intel OneAPI SDK | [docker](https://hub.docker.com/r/ecpe4s/e4s-base-oneapi/tags) |
| Singularity | e4s-base-oneapi-26-06.sif | Minimal base image with MPICH, CMake, and the Intel OneAPI SDK | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-base-oneapi-26-06.sif) |

-----

### Minimal Spack

This image contains a minimal setup for using Spack Core v1.1.1 w/ GNU and/or CUDA/ROCm/OneAPI compilers.

##### X86\_64, PPC64LE, AARCH64

| Format | Variant | Architecture | Description | Download |
|---|---|---|---|---|
| Docker | CPU | Multi-arch | Minimal Spack Core v1.1.1 environment with GNU compilers | [docker](https://hub.docker.com/r/ecpe4s/e4s-spack-cpu/tags) |
| Docker | CUDA | Multi-arch | Minimal Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers | [docker](https://hub.docker.com/r/ecpe4s/e4s-spack-cuda/tags) |
| Docker | ROCm | Multi-arch | Minimal Spack Core v1.1.1 environment with GNU and AMD ROCm compilers | [docker](https://hub.docker.com/r/ecpe4s/e4s-spack-rocm/tags) |
| Docker | OneAPI | Multi-arch | Minimal Spack Core v1.1.1 environment with GNU and Intel OneAPI compilers | [docker](https://hub.docker.com/r/ecpe4s/e4s-spack-oneapi/tags) |
| Singularity | CPU | x86_64 | Minimal Spack Core v1.1.1 environment with GNU compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-x86_64-26-06.sif) |
| Singularity | CPU | aarch64 | Minimal Spack Core v1.1.1 environment with GNU compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-aarch64-26-06.sif) |
| Singularity | CPU | ppc64le | Minimal Spack Core v1.1.1 environment with GNU compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cpu-ppc64le-26-06.sif) |
| Singularity | CUDA | x86_64 | Minimal Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-x86_64-26-06.sif) |
| Singularity | CUDA | aarch64 | Minimal Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-aarch64-26-06.sif) |
| Singularity | CUDA | ppc64le | Minimal Spack Core v1.1.1 environment with GNU and NVIDIA CUDA compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-cuda-ppc64le-26-06.sif) |
| Singularity | ROCm | x86_64 | Minimal Spack Core v1.1.1 environment with GNU and AMD ROCm compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-rocm-x86_64-26-06.sif) |
| Singularity | OneAPI | x86_64 | Minimal Spack Core v1.1.1 environment with GNU and Intel OneAPI compilers | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/26.06/e4s-spack-oneapi-x86_64-26-06.sif) |

-----

### DOE LLVM E4S Image

This multi-architecture image contains E4S products compiled with DOE LLVM 16 and Flang using Spack

##### Multi-Arch (X86\_64, PPC64LE, AARCH64)

| Format | Architecture | Image | Description | Download |
|---|---|---|---|---|
| Docker | Multi-arch | ecpe4s/e4s-doe-llvm:23.05 | E4S products compiled with DOE LLVM 16 and Flang | [docker](https://hub.docker.com/r/ecpe4s/e4s-doe-llvm/tags) |
| Singularity | x86_64 | e4s-doe-llvm-x86\_64-23.05.sif | E4S products compiled with DOE LLVM 16 and Flang | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-x86_64-23.05.sif) |
| Singularity | aarch64 | e4s-doe-llvm-aarch64-23.05.sif | E4S products compiled with DOE LLVM 16 and Flang | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-aarch64-23.05.sif) |
| Singularity | ppc64le | e4s-doe-llvm-ppc64le-23.05.sif | E4S products compiled with DOE LLVM 16 and Flang | [singularity](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-ppc64le-23.05.sif) |

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

-----

### E4S Facility Deployment

  * [NERSC](https://docs.nersc.gov/applications/e4s/)
  * [OLCF](https://docs.olcf.ornl.gov/software/e4s.html)

-----

### AWS EC2 Image

The E4S 26.06 release is also available on [AWS](http://aws.amazon.com/) as an EC2 AMI with ID ami-0e752117cfa13cb9b in the US-West-2 (Oregon) region.

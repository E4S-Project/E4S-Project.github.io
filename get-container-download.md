---
layout: single
title: "E4S Container Download"
redirect_from:
  - /download.html
permalink: /container-download/
classes: wide
sidebar:
  nav: "getmenu"
---


### Acquiring E4S Containers

The current E4S container offerings include Docker and Singularity images capable of running on X86_64, PPC64LE, and AARCH64 architectures. Our full E4S Release images are based on Ubuntu 24.04 and Rocky 9.6 (x86_64, aarch64, ppc64le). In addition to offering a full E4S image containing a comprehensive selection of E4S software released on a bi-annual cycle, we also offer a set of minimal base images suitable for use in Continuous Integration (CI) pipelines where Spack is used to build packages.

Docker images are available on the [E4S Docker Hub](https://hub.docker.com/u/ecpe4s).
Please see the [E4S 25.11 Release Notes](https://oaciss.uoregon.edu/e4s/talks/E4S_25.11.pdf).


-----

### Container Releases

  * [Docker Downloads - CPU only - Ubuntu](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags)
  * [Docker Downloads - CPU only - Rocky](https://hub.docker.com/r/ecpe4s/e4s-cpu-rocky9.6/tags)
  * [Docker Downloads - CUDA - Ubuntu](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags)
  * [Docker Downloads - CUDA - Rocky](https://hub.docker.com/r/ecpe4s/e4s-cuda-rocky9.6/tags)
  * [Docker Downloads - ROCm](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags)
  * [Docker Downloads - OneAPI](https://hub.docker.com/r/ecpe4s/e4s-oneapi/tags)
  * [Singularity x86\_64 Download - CPU only - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CPU only - Rocky](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-rocky9.6-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CUDA 80 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda80-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CUDA 90 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CUDA 90 - Rocky](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-rocky9.6-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CUDA 120 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - CUDA 120 - Rocky](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-rocky9.6-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - ROCm gfx942 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm942-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - ROCm gfx90a - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm90a-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - ROCm gfx908 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm908-x86_64-25.11.sif)
  * [Singularity x86\_64 Download - OneAPI - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-oneapi-x86_64-25.11.sif)
  * [Singularity ppc64le Download - CUDA 70 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda70-ppc64le-25.11.sif)
  * [Singularity aarch64 Download - CPU only - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-aarch64-25.11.sif)
  * [Singularity aarch64 Download - CUDA 80 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda80-aarch64-25.11.sif)
  * [Singularity aarch64 Download - CUDA 90 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-aarch64-25.11.4.sif)
  * [Singularity aarch64 Download - CUDA 90 - Rocky](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-rocky9.6-aarch64-25.11.4.sif)
  * [Singularity aarch64 Download - CUDA 120 - Ubuntu](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-aarch64-25.11.6.sif)
  * [Singularity aarch64 Download - CUDA 120 - Rocky](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-rocky9.6-aarch64-25.11.4.sif)
  * [OVA Download](http://tau.uoregon.edu/ecp.ova)

-----


### Note on Container Images

Container images contain binary versions of the Full Release packages listed above. Full-featured GPU-enabled container images are available from Dockerhub:

```bash
# docker pull ecpe4s/e4s-cuda:25.11-cuda120
# docker pull ecpe4s/e4s-cuda:25.11-cuda90
# docker pull ecpe4s/e4s-cuda:25.11-cuda80
# docker pull ecpe4s/e4s-cuda:25.11-cuda70
# docker pull ecpe4s/e4s-cuda-rocky9.6:25.11-cuda120
# docker pull ecpe4s/e4s-cuda-rocky9.6:25.11-cuda90
# docker pull ecpe4s/e4s-rocm:25.11-rocm942
# docker pull ecpe4s/e4s-rocm:25.11-rocm90a
# docker pull ecpe4s/e4s-rocm:25.11-rocm908
# docker pull ecpe4s/e4s-oneapi:25.11
# docker pull ecpe4s/e4s-cpu:25.11
# docker pull ecpe4s/e4s-cpu-rocky9.6:25.11
```

### E4S Full GPU Images

These images contain a full Spack-based deployment of E4S, including GPU-enabled packages for NVIDIA, AMD, or Intel GPUs.

These images also contain NVIDIA NeMo, NVIDIA BioNeMo, VLLM, PyTorch, TensorFlow, and TAU.

##### AMD ROCm (x86\_64)

  * ecpe4s/e4s-rocm:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-rocm/tags)
  * e4s-rocm942-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm942-x86_64-25.11.sif)
  * e4s-rocm90a-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm90a-x86_64-25.11.sif)
  * e4s-rocm908-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-rocm908-x86_64-25.11.sif)

##### NVIDIA CUDA (X86\_64, PPC64LE, AARCH64)

  * ecpe4s/e4s-cuda:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-cuda/tags)
  * e4s-cuda80-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda80-x86_64-25.11.sif)
  * e4s-cuda90-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-x86_64-25.11.sif)
  * e4s-cuda120-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-x86_64-25.11.sif)
  * e4s-cuda90-rocky9.6-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-rocky9.6-x86_64-25.11.sif)
  * e4s-cuda120-rocky9.6-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-rocky9.6-x86_64-25.11.sif)
  * e4s-cuda70-ppc64le-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda70-ppc64le-25.11.sif)
  * e4s-cuda80-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda80-aarch64-25.11.sif)
  * e4s-cuda90-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-aarch64-25.11.sif)
  * e4s-cuda120-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-aarch64-25.11.sif)
  * e4s-cuda90-rocky9.6-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda90-rocky9.6-aarch64-25.11.sif)
  * e4s-cuda120-rocky9.6-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cuda120-rocky9.6-aarch64-25.11.sif)

##### Intel OneAPI (x86\_64)

  * ecpe4s/e4s-oneapi:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-oneapi/tags)
  * e4s-oneapi-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-oneapi-x86_64-25.11.sif)

##### CPU-only (x86\_64, aarch64)

  * ecpe4s/e4s-cpu:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-cpu/tags)
  * e4s-cpu-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-x86_64-25.11.sif)
  * e4s-cpu-rocky9.6-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-rocky9.6-x86_64-25.11.sif)
  * e4s-cpu-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-aarch64-25.11.sif)
  * e4s-cpu-rocky9.6-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-cpu-rocky9.6-aarch64-25.11.sif)

-----

### GPU Base Images

These images come with MPICH, CMake, and the relevant GPU SDK -- either AMD ROCm, NVIDIA CUDA Toolkit and NVHPC, or Intel OneAPI.

##### AMD ROCM (X86\_64)

  * ecpe4s/e4s-base-rocm:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-base-rocm/tags)
  * e4s-base-rocm-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-base-rocm-25.11.sif)

##### NVIDIA Multi-Arch (X86\_64, PPC64LE, AARCH64)

  * ecpe4s/e4s-base-cuda:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-base-cuda/tags)
  * e4s-base-cuda-x86\_64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-base-cuda-x86_64-25.11.sif)
  * e4s-base-cuda-aarch64-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-base-cuda-aarch64-25.11.sif)
  * e4s-base-cuda-ppc64le-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-base-cuda-ppc64le-25.11.sif)

##### Intel OneAPI (X86\_64)

  * ecpe4s/e4s-base-oneapi:25.11 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-base-oneapi/tags)
  * e4s-base-oneapi-25.11.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/25.11/e4s-base-oneapi-25.11.sif)

-----

### Minimal Spack

This image contains a minimal setup for using Spack 0.22.0 w/ GNU compilers

##### X86\_64, PPC64LE, AARCH64

  * ecpe4s/ubuntu20.04 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu20.04/tags)
  * ecpe4s-ubuntu20.04-x86\_64-24.02.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/24.02/ecpe4s-ubuntu20.04-x86_64-24.02.sif)
  * ecpe4s-ubuntu20.04-ppc64le-24.02.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/24.02/ecpe4s-ubuntu20.04-ppc64le-24.02.sif)
  * ecpe4s-ubuntu20.04-aarch64-24.02.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/24.02/ecpe4s-ubuntu20.04-aarch64-24.02.sif)

-----

### DOE LLVM E4S Image

This multi-architecture image contains E4S products compiled with DOE LLVM 16 and Flang using Spack

##### Multi-Arch (X86\_64, PPC64LE, AARCH64)

  * ecpe4s/e4s-doe-llvm:23.05 [[docker]](https://hub.docker.com/r/ecpe4s/e4s-doe-llvm/tags)
  * e4s-doe-llvm-x86\_64-23.05.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-x86_64-23.05.sif)
  * e4s-doe-llvm-aarch64-23.05.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-aarch64-23.05.sif)
  * e4s-doe-llvm-ppc64le-23.05.sif [[singularity]](https://oaciss.nic.uoregon.edu/e4s/images/23.05/e4s-doe-llvm-ppc64le-23.05.sif)

-----

### Application-Specific Continuous Integration Images

  * ecpe4s/sollve-rocm6.3.0 [[docker]](https://hub.docker.com/r/ecpe4s/sollve-rocm6.3.0/tags)
  * ecpe4s/sollve-cuda12.6.3-arm64 [[docker]](https://hub.docker.com/r/ecpe4s/sollve-cuda12.6.3-arm64/tags)
  * ecpe4s/sollve-cuda12.6.3-amd64 [[docker]](https://hub.docker.com/r/ecpe4s/sollve-cuda12.6.3-amd64/tags)
  * ecpe4s/trilinos-sycl [[docker]](https://hub.docker.com/r/ecpe4s/trilinos-sycl/tags)
  * ecpe4s/trilinos-ci-rocm6.2.1 [[docker]](https://hub.docker.com/r/ecpe4s/trilinos-ci-rocm6.2.1/tags)
  * ecpe4s/trilinos-ci-cuda12.2.2 [[docker]](https://hub.docker.com/r/ecpe4s/trilinos-ci-cuda12.2.2/tags)
  * ecpe4s/trilinos-ci-arm64-cuda12 [[docker]](https://hub.docker.com/r/ecpe4s/trilinos-ci-arm64-cuda12/tags)
  * ecpe4s/exawind-snapshot [[docker]](https://hub.docker.com/r/ecpe4s/exawind-snapshot/tags)
  * ecpe4s/exago-cuda80 [[docker]](https://hub.docker.com/r/ecpe4s/exago-cuda80/tags)
  * ecpe4s/exago-rocm90a [[docker]](https://hub.docker.com/r/ecpe4s/exago-rocm90a/tags)

### Minimal Continuous Integration Images

##### X86\_64

  * ecpe4s/ubuntu22.04-runner-x86\_64 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu22.04-runner-x86_64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/ubuntu20.04-runner-x86\_64 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu20.04-runner-x86_64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/ubuntu18.04-runner-x86\_64 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu18.04-runner-x86_64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/rhel8-runner-x86\_64 [[docker]](https://hub.docker.com/r/ecpe4s/rhel8-runner-x86_64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/rhel7-runner-x86\_64 [[docker]](https://hub.docker.com/r/ecpe4s/rhel7-runner-x86_64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)

##### PPC64LE

  * ecpe4s/ubuntu22.04-runner-ppc64le [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu22.04-runner-ppc64le/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/ubuntu20.04-runner-ppc64le [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu20.04-runner-ppc64le/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/ubuntu18.04-runner-ppc64le [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu18.04-runner-ppc64le/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/rhel8-runner-ppc64le [[docker]](https://hub.docker.com/r/ecpe4s/rhel8-runner-ppc64le/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/rhel7-runner-ppc64le [[docker]](https://hub.docker.com/r/ecpe4s/rhel7-runner-ppc64le/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)

##### AARCH64

  * ecpe4s/ubuntu22.04-runner-aarch64 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu22.04-runner-aarch64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/ubuntu20.04-runner-aarch64 [[docker]](https://hub.docker.com/r/ecpe4s/ubuntu20.04-runner-aarch64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)
  * ecpe4s/rhel8-runner-aarch64 [[docker]](https://hub.docker.com/r/ecpe4s/rhel8-runner-aarch64/tags) [[github]](https://github.com/UO-OACISS/e4s/tree/master/docker-recipes)

-----

### Custom Images

  * ecpe4s/waggle-ml [[docker]](https://hub.docker.com/r/ecpe4s/waggle-ml/tags)
  * ecpe4s/exawind-snapshot [[docker]](https://hub.docker.com/r/ecpe4s/exawind-snapshot/tags)
  * ecpe4s/superlu\_sc [[docker]](https://hub.docker.com/r/ecpe4s/superlu_sc/tags)

-----

### E4S Facility Deployment

  * [NERSC](https://docs.nersc.gov/applications/e4s/)
  * [OLCF](https://docs.olcf.ornl.gov/software/e4s.html)

-----

### AWS EC2 Image

The E4S 25.11 release is also available on [AWS](http://aws.amazon.com/) as an EC2 AMI with ID ami-0e752117cfa13cb9b in the US-West-2 (Oregon) region.

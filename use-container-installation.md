---
layout: single
title: "E4S Container Installation"
permalink: /container-installation/
classes: wide
sidebar:
  nav: "usemenu"
---

# Container installation recipes

## Docker

To use the Docker image, please install Docker and pull the appropriate image from Docker Hub.

```
bash
# docker images
# docker pull ecpe4s/e4s-gpu:22.02
# docker run --gpus all -v $HOME:$HOME --rm -it ecpe4s/e4s-gpu:22.02
# Inside the Docker container:
# which spack
# cd /opt/demo/python_tests
# conda activate cuda
# ./run.sh
# cd /opt/demo/testsuite/validation_tests/trilinos
# ./compile.sh
# ./run.sh
```

## Singularity

```
bash
# which singularity
# wget http://tau.uoregon.edu/ecp.simg
# singularity exec ./ecp.simg /bin/bash --rcfile /etc/bash.bashrc
# which spack
```

**Replacing MPI on Theta at ALCF: allocate two nodes**

```
bash
% qsub -A <PROJECT_ID> -t 30 -n 2 -q debug-cache-quad -I
% /projects/ECP_SDK/tutorial/run_job.sh
% cat /projects/ECP_SDK/tutorial/run_job.sh
module swap PrgEnv-intel PrgEnv-gnu
module swap cray-mpich cray-mpich-abi
export SINGULARITYENV_LIBWLM_DETECT=/opt/cray/wlm_detect/1.3.2-6.0.6.0_3.8__g388ccd5.ari/lib64
aprun -n 16 -N 8 singularity exec -H $HOME   -B /projects/ECP_SDK:/projects/ECP_SDK:ro   -B /opt:/opt:ro -B /var/opt:/var/opt:ro   /projects/ECP_SDK/containers/singularity/ecp.simg bash -c 'unset CRAYPE_VERSION; source /usr/local/packages/ecp/misc/bashrc;  spack load -r trilinos tau; spack unload openmpi mpich;  export LD_LIBRARY_PATH=$LIBWLM_DETECT:$CRAY_LD_LIBRARY_PATH:$CRAYPAT_LD_LIBRARY_PATH:$LD_LIBRARY_PATH;  /projects/ECP_SDK/tutorial/demo/trilinos/Zoltan/Zoltan;'
```

## Shifter

**Replacing MPI with system MPI on Cori at NERSC**

```
bash
# shifterimg -v pull docker:ecpe4s/e4s-gpu:22.02
# shifter -E --image=ecpe4s/e4s-gpu:22.02 -- /bin/bash --rcfile /etc/bash.bashrc
# which spack

# shifterimg images | grep exascaleproject

# salloc -N 2 -q interactive -t 00:30:00 --image=ecpe4s/e4s-gpu:22.02 -C haswell -L SCRATCH
# srun -n 32 shifter -- /bin/bash -c 'unset CRAYPE_VERSION; . /etc/bash.bashrc;   spack load trilinos; spack unload openmpi mpich; ./Zoltan'
```

Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.

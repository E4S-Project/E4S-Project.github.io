 <style type="text/css" rel="stylesheet">
 pre { text-align: left important!; }
 </style>

## Container installation recipes

### Docker

To use the Docker image, please install docker and download the ecp.xz (or .tgz) file from the [download page](https://e4s-project.github.io/download.html):

```
# wget http://tau.uoregon.edu/ecp.xz
# unxz -c ecp.xz | docker load
```
OR 
```
# wget http://tau.uoregon.edu/ecp.tgz
# gunzip -c ecp.tgz | docker load
```

```
# docker images
# docker pull ecpe4s/ubuntu18.04-e4s-gpu
# docker run --gpus all -v $HOME:$HOME --rm -it ecpe4s/ubuntu18.04-e4s-gpu 
Inside the Docker container:
# which spack
# cd /opt/demo/python_tests; ./run.sh
# cd /opt/demo/trilinos/Zoltan; ./compile.sh; ls -l Zoltan
# ./run.sh
```

### Singularity

```
# which singularity
# wget http://tau.uoregon.edu/ecp.simg
# singularity exec ./ecp.simg /bin/bash --rcfile /etc/bashrc
# which spack
```
Replacing MPI On Theta at ALCF: Allocate two nodes:
```
% qsub -A  -t 30 -n 2  -q debug-cache-quad  -I
% /projects/ECP_SDK/tutorial/run_job.sh
% cat /projects/ECP_SDK/tutorial/run_job.sh
module swap PrgEnv-intel PrgEnv-gnu
module swap cray-mpich cray-mpich-abi
export SINGULARITYENV_LIBWLM_DETECT=/opt/cray/wlm_detect/1.3.2-6.0.6.0_3.8__g388ccd5.ari/lib64
aprun -n 16 -N 8 singularity exec -H $HOME    -B /projects/ECP_SDK:/projects/ECP_SDK:ro -B /opt:/opt:ro -B /var/opt:/var/opt:ro /projects/ECP_SDK/containers/singularity/ecp.simg bash -c 'unset CRAYPE_VERSION; source /usr/local/packages/ecp/misc/bashrc; spack load -r trilinos tau ;spack unload openmpi mpich ;  export LD_LIBRARY_PATH=$LIBWLM_DETECT:$CRAY_LD_LIBRARY_PATH:$CRAYPAT_LD_LIBRARY_PATH:$LD_LIBRARY_PATH   ; /projects/ECP_SDK/tutorial/demo/trilinos/Zoltan/Zoltan; '
```

### Shifter

Replacing MPI with system MPI on Cori at NERSC:
```
# shifterimg -v pull docker:ecpe4s/ubuntu18.04-e4s-gpu
# shifter -E --image=ecpe4s/ubuntu18.04-e4s-gpu -- /bin/bash --rcfile /etc/bashrc
# which spack

# shifterimg images | grep exascaleproject

# salloc -N 2 -q interactive -t 00:30:00 --image=ecpe4s/ubuntu18.04-e4s-gpu -C haswell -L SCRATCH
# srun -n 32 shifter  -- /bin/bash  -c 'unset CRAYPE_VERSION;  . /etc/bashrc ; spack load -r trilinos; spack unload openmpi mpich; ./Zoltan'
```
### Charliecloud

```
# wget http://tau.uoregon.edu/ecp-cc.tgz
# tar xf ecp-cc.tgz
# ch-run --bind=$HOME:$HOME ./ecp-cc -- /bin/bash --rcfile /etc/bashrc
# which spack
# cat /usr/local/packages/ecp/Acknowledgment.txt
```
If you wish to use the OVA file, please contact below for login information. The OVA file has Docker, Singularity, Shifter, and Charliecloud preinstalled. 


Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.

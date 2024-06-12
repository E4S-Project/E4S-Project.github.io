 <style type="text/css" rel="stylesheet">
 pre { text-align: left important!; }
 </style>

## Container installation recipes

### Docker

To use the Docker image, please install docker and pull the appropraite image from Docker Hub.

```
# docker images
# docker pull ecpe4s/e4s-gpu:22.02
# docker run --gpus all -v $HOME:$HOME --rm -it ecpe4s/e4s-gpu:22.02
Inside the Docker container:
# which spack
# cd /opt/demo/python_tests
# conda activate cuda
# ./run.sh
# cd /opt/demo/testsuite/validation_tests/trilinos
# ./compile.sh
# ./run.sh
```

### Singularity

```
# which singularity
# wget http://tau.uoregon.edu/ecp.simg
# singularity exec ./ecp.simg /bin/bash --rcfile /etc/bash.bashrc
# which spack
```

### Shifter

```
# shifterimg -v pull docker:ecpe4s/e4s-gpu:22.02
# shifter -E --image=ecpe4s/e4s-gpu:22.02 -- /bin/bash --rcfile /etc/bash.bashrc
# which spack
```

Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.

 <style type="text/css" rel="stylesheet">
 pre { text-align: left important!; }
 </style>

## Manual Installation Instructions

### References

[Spack General Documentation](https://spack.readthedocs.io/en/latest/)

[Spack Environments Documentation](https://spack.readthedocs.io/en/latest/environments.html)

[Spack Build Cache Documentation](https://spack.readthedocs.io/en/latest/binary_caches.html)

[E4S Model Environment Repository](https://github.com/E4S-Project/e4s)

[E4S 25.06 Model Environments](https://github.com/E4S-Project/e4s/tree/master/environments/25.06)

[E4S Homepage](https://e4s.io)

### Instructions

Clone Spack, checkout the appropriate release branch, if desired, and source the Spack `setup-env.sh` script.
```
$> git clone https://github.com/spack/spack
$> (cd spack && git checkout e4s-25.06)
$> . spack/share/spack/setup-env.sh
```

Configure Spack to know where the E4S Build Cache is located. You can use either a release specific build cache, or the mixed build cache. The release specific build cache contains only binaries from the particular release, whereas the mixed build cache contains binaries from all releases and from in between releases.

Release-specific:
```
$> spack mirror add E4S https://cache.e4s.io/25.06
$> spack buildcache keys -it
```

Obtain a copy of the E4S Model Environment for the E4S release you are interested in, and rename it to `spack.yaml`, if needed. These are found in the [E4S Environment Repository](https://github.com/E4S-Project/e4s/tree/master/environments). For this example, we will use the [E4S 25.06 Model Environment for X86_64 Systems with NVIDIA GPUs](https://github.com/E4S-Project/e4s/tree/master/environments/25.06/amd64-gcc-cuda-ubuntu22.04).

Tweak the model environment so that it suits your needs: remove packages you aren't interested in, select the correct GPU variants, specify the microarchitecture target and compiler selections, as needed. Once modified, you can concretize the environment, which you should do from the same directory that contains your environment.
```
$> time spack -e . concretize -f | tee concretize.log
```

Start the install, specifying `-jN` where N reflects an appropriate degree of parallelism to use for the builds, as in `make -jN`.
```
$> spack -e . install -jN
```

Build times can be quite a long time depending on the modifications you make to the environment and the capabilities of the machine you use for building. If you are using an E4S release branch of Spack, and using a minimally modified E4S release environment where the same compilers, operating system, and target architecture are retained, that will maximize your ability to pull pre-built packages from the build cache.

Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.




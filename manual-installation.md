 <style type="text/css" rel="stylesheet">
 pre { text-align: left important!; }
 </style>

## Manual Installation Instructions

### References

* [Spack General Documentation](https://spack.readthedocs.io/en/latest/)
* [Spack Environments Documentation](https://spack.readthedocs.io/en/latest/environments.html)
* [Spack Build Cache Documentation](https://spack.readthedocs.io/en/latest/binary_caches.html)
* [E4S Model Environment Repository](https://github.com/E4S-Project/e4s)
* [E4S 21.11 Model Environments](https://github.com/E4S-Project/e4s/tree/master/environments/21.11)
* [E4S Homepage](https://e4s.io)

### Instructions

If you want to use Spack's Clingo-based concretizer, you can either let Spack bootstrap Clingo for you, or you can install it manually via pip, in which case Spack will not need to bootstrap it. To install it via `pip`:

```
$> pip install --user --upgrade pip
$> pip install --user clingo
```

Clone Spack, checkout the appropriate release branch, if desired, and source the Spack `setup-env.sh` script.
```
$> git clone https://github.com/spack/spack
$> (cd spack && git checkout e4s-21.11)
$> . spack/share/spack/setup-env.sh
```

Configure Spack to know where the E4S Build Cache is located. You can use either a release specific build cache, or the mixed build cache. The release specific build cache contains only binaries from the particular release, whereas the mixed build cache contains binaries from all releases and from in between releases.

Release-specific
```
$> spack mirror add E4S https://cache.e4s.io/21.11
$> spack buildcache keys -it
```

Mixed Cache
```
$> spack mirror add E4S https://cache.e4s.io
$> spack buildcache keys -it
```

Obtain a copy of the E4S Model Environment for the E4S release you are interested in, and rename it to `spack.yaml`, if needed. These are found in the [E4S Environment Repository](https://github.com/E4S-Project/e4s). For this example, we will use the [E4S 21.11 Model Environment](https://github.com/E4S-Project/e4s/blob/master/environments/21.11/spack-x86_64.yaml).

Tweak the model environment so that it suits your needs: remove packages you aren't interested in, select the correct GPU variants, specify the microarchitecture target and compiler selections, as needed. Once modified, you can concretize the environment, which you should do from the same directory that contains your environment.
```
$> time spack -e . concretize -f | tee concretize.log
```

6. Start the install, specifying `-j<N>` where N reflects an appropriate degree of parallelism to use for the builds.
```
$> spack -e . install -j<N>
```

7. Build times can be quite a long time depending on the modifications you make to the environment and the capabilities of the machine you use for building. If you are using an E4S release branch of Spack, and using a minimally modified E4S release environment where the same compilers, operating system, and target architecture are retained, that will maximize your ability to pull pre-built packages from the build cache.

Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.




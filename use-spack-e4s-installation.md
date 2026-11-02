---
layout: single
title: "E4S-specific Installation Using Spack"
permalink: /spack-e4s-installation/
classes: wide
sidebar:
  nav: "getmenu"
---

{% include e4s-page-actions.html %}

## Manual Installation Instructions

The instructions on this page provide specific guidance for using Spack to install E4S.  See [Finding and installing products using Spack](/use-spack-installation/) for general Spack instruction on how to install individual E4S-related products.

### Instructions

Clone Spack, checkout the appropriate release branch, if desired, and source the Spack `setup-env.sh` script.
```
$> git clone https://github.com/spack/spack.git
$> cd spack
$> git checkout v1.1.1
$> cd ..
$> git clone -b e4s-26.06 https://github.com/spack/spack-packages.git
$> . spack/share/spack/setup-env.sh
$> spack repo set --destination $(pwd)/spack-packages builtin
$> export SPACK_DISABLE_LOCAL_CONFIG=1
```

Configure Spack to know where the E4S Build Cache is located. You can use either a release specific build cache, or the mixed build cache. The release specific build cache contains only binaries from the particular release, whereas the mixed build cache contains binaries from all releases and from in between releases.

Release-specific:
```
$> spack mirror add E4S https://cache.e4s.io/26.06
$> spack buildcache keys -it
```

Obtain a copy of the E4S Model Environment for the E4S release you are interested in, and rename it to `spack.yaml`, if needed. These are found in the [E4S Environment Repository](https://github.com/E4S-Project/e4s/tree/master/environments). For this example, we will use the [E4S 26.06 Model Environment for X86_64 Systems with NVIDIA GPUs](https://github.com/E4S-Project/e4s/tree/master/environments/x86_64/gnu/cuda/90).

The environment will also need the `package.yaml` file under the `_config` directory, [for this example, found here](https://github.com/E4S-Project/e4s/blob/master/environments/x86_64/gnu/_config/packages.yaml) . For CUDA and ROCm builds, another GPU-specific `packages.yaml` [is also needed](https://github.com/E4S-Project/e4s/blob/master/environments/x86_64/gnu/cuda/_config/packages.yaml). Create the relevant directories following this guideline:

```text
E4S-build/
├── _config/
│   └── packages.yaml
└── cuda/                         # Or cpu, rocm
    ├── _config/                  # For GPU builds only
    │   └── packages.yaml         # For GPU builds only
    └── 90/                       # Example GPU architecture/compute capability, for GPU builds only
        └── spack.yaml            # Environment definition file

```
Obtain `spack.yaml` and both `packages.yaml` as they appear in this structure of the environment repository above.

Tweak the model environment so that it suits your needs: remove packages you aren't interested in, select the correct GPU variants, specify the microarchitecture target and compiler selections, as needed. Once modified, you can concretize the environment, which you should do from the same directory that contains your environment (`spack.yaml`).
```
$> time spack -e . concretize -f | tee concretize.log
```

Start the install, specifying `-jN` where N reflects an appropriate degree of parallelism to use for the builds, as in `make -jN`.
```
$> spack -e . install -jN
```

Build times can be quite a long time depending on the modifications you make to the environment and the capabilities of the machine you use for building. If you are using an E4S release branch of Spack, and using a minimally modified E4S release environment where the same compilers, operating system, and target architecture are retained, that will maximize your ability to pull pre-built packages from the build cache.

Please contact Sameer Shende at sameer [at] cs.uoregon.edu if you have any questions.

### References

- [Spack General Documentation](https://spack.readthedocs.io/en/latest/)
- [Spack Environments Documentation](https://spack.readthedocs.io/en/latest/environments.html)
- [Spack Build Cache Documentation](https://spack.readthedocs.io/en/latest/binary_caches.html)
- [E4S Model Environment Repository](https://github.com/E4S-Project/e4s)
- [E4S 25.06 Model Environments](https://github.com/E4S-Project/e4s/tree/master/environments/25.06)
- [E4S Homepage](https://e4s.io)

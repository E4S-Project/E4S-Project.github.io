---
layout: single
title: "Finding and installing products using Spack"
permalink: /spack-installation/
classes: wide
sidebar:
  nav: "getmenu"
---

{% include e4s-page-actions.html %}

# Introduction

Spack is a flexible package manager designed for scientific software. It supports multiple compiler versions, dependency resolution, build variants, and installation into isolated environments. This guide provides step-by-step instructions on how to **search for**, **inspect**, and **install** libraries and tools using Spack.

### From source with Spack

[Visit the Spack Project](https://spack.readthedocs.io/en/latest/)

Spack contains packages for all of the products listed in the E4S 25.06 Full Release category. General instructions for building software with Spack can be found at the Spack website. Questions concerning building those packages are deferred to the associated package development team.

Some quickstart instructions are below.


---

## 1. Set Up Spack

### 1.1 Clone Spack Core V.1.1.1
```bash
git clone -b releases/v1.1 https://github.com/spack/spack.git
```

### 1.2 Clone the E4S 26.06 branch of Spack Packages
```bash
git clone -b e4s-26.06 https://github.com/spack/spack-packages.git
```
### 1.3 Set builtin Spack repo destination

```bash
spack repo set --destination "$(dirname "$SPACK_ROOT")/spack-packages" builtin
```
### 1.4 Add Spack to your shell

From the Spack core directory:
```bash
. share/spack/setup-env.sh
```

To isolate this Spack instance from user- and system- level configuration directories, set `SPACK_DISABLE_LOCAL_CONFIG=1`.

To load Spack automatically on startup, add the above line to your shell profile (e.g., `~/.bashrc`, `~/.zshrc`).

---

## 2. Finding Libraries and Tools

### 2.1 Basic search
```bash
spack list <name_of_package>
```
Example:
```bash
spack list tau
```

### 2.2 List all available packages 
```bash
spack list
```
### 2.3 List all packages in E4S

```bash
spack list --tag e4s
```

## 3. Inspecting Package Details

### 3.1 Show detailed information
```bash
spack info <package>
```
This displays:
- Description
- Available versions
- Variants (options)
- Dependencies
- Licenses

Example:
```bash
spack info hdf5
```

### 3.2 View available versions
```bash
spack versions <package>
```

---

## 4. Installing Packages

### 4.1 Basic installation
```bash
spack install <package>
```

### 4.2 Install a specific version
```bash
spack install <package>@<version>
```

Example:
```bash
spack install fftw@3.3.10
```

---

## 5. Customizing Builds with Variants

Most scientific software has optional features. Use `+` to enable and `~` to disable features.

Example: Enable MPI and threading in HDF5
```bash
spack install hdf5 +mpi +threadsafe
```

Example: Disable shared libraries
```bash
spack install trilinos ~shared
```

---

## 6. Selecting Compilers

### 6.1 List available compilers
```bash
spack compilers
```

### 6.2 Add a new compiler
```bash
spack compiler find
```

### 6.3 Install with a specific compiler
```bash
spack install kokkos %gcc@13.3.1
```

### 6.4 Install with variants and compiler
```bash
spack install petsc +mpi +debug %gcc@11.4.0
```
---

## 7. Managing Dependencies

Spack resolves dependencies automatically. To view the dependency tree:
```bash
spack spec <package>
```
Example:
```bash
spack spec kokkos +cuda cuda_arch=90
```
---

## 8. Using Installed Packages

### 8.1 View installed packages
```bash
spack find
spack find -d   # include dependencies
```

### 8.2 Load a package into your environment
```bash
spack load <package>
```

### 8.3 Unload a package
```bash
spack unload <package>
```
---

## 9. Using Environments (Recommended)

Spack environments let you manage sets of packages together.

### 9.1 Create an environment
```bash
spack env create myenv
spack env activate myenv
```

### 9.2 Add and install packages
```bash
spack add trilinos +mpi
spack add kokkos +cuda +wrapper cuda_arch=90
spack install
```

Note that some packages, like Kokkos, default to `cuda_arch=None` (check with `spack info kokkos`). This variable must be specified according to the CUDA compute capability with which the package is being built.

### 9.3 View environment packages
```bash
spack find
```

### 9.4 Deactivate environment
```bash
spack env deactivate
```
---

## 10. Using Binary Caches (Faster Installs)

To see available prebuilt binaries:
```bash
spack buildcache list
```

Spack will use binaries automatically if available.

---

## 11. Troubleshooting

| Issue | Solution |
|------|-----------|
| Build failed | `spack -d install <pkg>` for debug output |
| Wrong compiler used | Specify `%compiler` explicitly |
| Dependency mismatch | Check with `spack spec <pkg>` |
| Clean build | `spack clean --all` |

---

## 12. Advanced Tips

- **Search by tags**:
  ```bash
  spack list --tag <tag>
  ```

- **Find reverse dependencies**:
  ```bash
  spack dependents <package>
  ```

- **Get help**:
  ```bash
  spack help
  spack help install
  ```

---

## 13. Summary Workflow

```bash
# Find a package
spack list <name>

# Inspect it
spack info <name>

# Customize & verify
spack spec <name +options %compiler@version>

# Install
spack install <name +options %compiler@version>

# Load for use
spack load <name>
```

---

## 15. Additional Resources

- Official documentation: https://spack.readthedocs.io  
- Package index: https://packages.spack.io  
- Tutorials: https://spack.io/tutorials  
- GitHub: https://github.com/spack/spack  

---

## Conclusion

Spack makes it easy to discover, configure, and install complex scientific software stacks. By understanding how to search for packages, inspect build options, control compilers and dependencies, and manage environments, you can consistently build powerful and reproducible software configurations.

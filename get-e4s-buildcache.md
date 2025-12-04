---
layout: single
title: "Use the E4S Spack Build Cache"
permalink: /e4s-buildcache/
classes: wide
sidebar:
  nav: "getmenu"
description: "Step-by-step instructions for installing E4S packages from prebuilt binaries using Spack’s build cache."
---

{% include e4s-page-actions.html %}

E4S publishes **prebuilt, cryptographically signed Spack binaries** (a *build cache*) for many supported platforms, compilers, and device SDKs. Using the build cache dramatically reduces install time and ensures consistency with tested E4S releases.

Below is a succinct, **copy-paste friendly** guide. You can follow it in a clean shell or inside a Spack environment.

---

## Prerequisites

1. **Install Spack** (same minor version used by the E4S release if possible).
   ```bash
   git clone https://github.com/spack/spack.git
   . spack/share/spack/setup-env.sh
   spack -V
   ```

2. **Load/Discover your compilers** (so your specs match cached binaries).
   ```bash
   module avail 2>/dev/null || true   # optional, on HPC systems
   spack compiler find
   spack compilers
   ```

3. **Know your target and OS triple** (to match the cache ABI):
   ```bash
   spack arch
   uname -a
   ```

> Tip: Binary compatibility is determined by OS/Libc, micro-architecture (e.g., `x86_64_v3`, `zen3`), compiler family/version, and relevant SDKs (CUDA/ROCm/oneAPI). Matching these to the E4S cache yields “install from binary” instead of “build from source”.

---

## Step 1 — Pick the E4S release and mirror URL

Decide which **E4S release** you intend to use (e.g., `25.11`). Your site or facility docs usually provide the exact mirror URL for that release and platform.

Set a variable for convenience (update as needed):

```bash
export E4S_REL=25.11
export E4S_MIRROR_URL="https://cache.e4s.io/${E4S_REL}"   # example; use your site’s URL if different
```

> If your center provides a *local* mirror, prefer that URL for faster downloads.

---

## Step 2 — Add the build cache as a Spack mirror

Add the mirror at a useful scope (user/site). You can add multiple mirrors; Spack will search them in order.

```bash
spack mirror add --scope=user e4s-${E4S_REL} "${E4S_MIRROR_URL}"
spack mirror list
```

---

## Step 3 — Trust E4S signing keys

E4S build caches are signed. Install and trust the public keys so Spack can verify binaries:

```bash
spack buildcache keys --install --trust
spack gpg list  # confirm keys are present and trusted
```

---

## Step 4 — See what binaries are available

List cache contents for a quick sanity check:

```bash
spack buildcache list -L | head -n 30
# or filter:
spack buildcache list -L | grep -i kokkos
spack buildcache list -L | grep -i cuda
```

To inspect a particular spec’s binary metadata:

```bash
spack buildcache info kokkos@4.3.1 ^cmake
```

---

## Step 5 — Install from the cache (single package)

**Spack ≥0.21** supports the `-b/--use-buildcache` policy:

- `-b only` : fail if no binary exists (never build from source)
- `-b auto` : use a binary if present; otherwise build from source
- `-b never`: never use binaries

Examples:

```bash
# Use binaries when available, otherwise build:
spack install -b auto kokkos +openmp %gcc@12.3.0 target=x86_64_v3

# Require a binary (good for strict reproducibility):
spack install -b only petsc@3.20.3 +mpi %gcc@12.3.0
```

**If you’re on an older Spack** that lacks `-b`, use:
```bash
spack install --use-buildcache kokkos +openmp %gcc@12.3.0
```

---

## Step 6 — Install from the cache using an environment (recommended)

Environments capture your stack in `spack.yaml`.

```bash
mkdir e4s-env && cd e4s-env
spack env activate -d .

# Create a simple environment file:
cat > spack.yaml <<'YAML'
spack:
  specs:
  - kokkos +openmp
  - hypre +mpi
  - petsc +mpi ~cuda
  concretizer:
    unify: true
  view: false
YAML

# Concretize and install, preferring binaries:
spack concretize -f
spack install -b auto
```

Optional quality-of-life:

```bash
# Generate Lmod/Tcl modules for the new installs
spack module lmod refresh -y   # or: spack module tcl refresh -y

# What got installed and from where:
spack find -vb      # shows versions and whether installed from binary
```

---

## Step 7 — Verify and (optionally) fetch without installing

- **Verify signatures and checksums** of cached packages you’ve installed:
  ```bash
  spack buildcache verify --rebuild-index=false $(spack find --format '{hash}' <spec>)
  ```
- **Download a cached tarball** to inspect (without installing):
  ```bash
  spack buildcache get kokkos@4.3.1 %gcc@12.3.0
  ls -lh ./build_cache
  ```

---

## Step 8 — GPU/SDK-aware installs (CUDA/ROCm/oneAPI)

Match your device SDK to the cache:

```bash
# NVIDIA CUDA example
spack install -b auto kokkos +cuda cuda_arch=80 %gcc@12.3.0

# AMD ROCm example
spack install -b auto kokkos +rocm amdgpu_target=gfx90a %gcc@12.3.0

# Intel oneAPI example
spack install -b auto oneapi-mkl %oneapi
```

> If the cache was built with different SDK versions or GPU targets than your system, Spack will either fall back to source builds (with `-b auto`) or fail (with `-b only`). Choose the policy that matches your intent.

---

## Common pitfalls & how to fix them

- **“No binary for spec”**  
  The cache doesn’t have your exact ABI tuple (OS/libc, micro-arch, compiler, SDK).  
  *Fix:* Adjust your spec (compiler version, targets like `target=x86_64_v3` or `target=zen3`, GPU arch), or allow source builds (`-b auto`). Confirm with `spack buildcache list -L`.

- **“Signature verification failed”**  
  Keys weren’t installed/trusted.  
  *Fix:* Re-run `spack buildcache keys --install --trust` and try again.

- **“Different Spack version/lock format”**  
  Using a substantially different Spack version than the cache was built with can cause misses.  
  *Fix:* Use the Spack version recommended for the E4S release, or let Spack build from source.

- **“Wrong compiler toolchain/module loaded”**  
  Your environment modules can influence concretization.  
  *Fix:* Load the intended compiler/module set before `spack concretize` or pin compilers in `spack.yaml`.

- **“CUDA/ROCm target mismatch”**  
  GPU arch flags don’t match the cache.  
  *Fix:* Set `cuda_arch` / `amdgpu_target` to match cached builds (or your hardware if you accept source builds).

---

## Useful commands (cheat sheet)

```bash
# Show mirrors and keys
spack mirror list
spack gpg list

# Search for packages and their variants
spack list kokkos
spack info kokkos

# Inspect binary metadata and availability
spack buildcache list -L | grep -i petsc
spack buildcache info petsc@3.20.3

# Install policies
spack install -b only <spec>    # require binary
spack install -b auto <spec>    # prefer binary, build if needed

# After install
spack find -vb
spack module lmod refresh -y
```

---

## FAQ

**Do I have to use the exact E4S release of Spack?**  
It’s strongly recommended for maximal binary hit-rate. Minor mismatches can still work but may reduce cache usage.

**Can I mix cached and source builds?**  
Yes. Use `-b auto` (or `--use-buildcache` on older Spack). This is a good default while you’re aligning your specs with the cache.

**Where do I find the mirror URL for my site?**  
Check your facility’s E4S/Spack docs or the E4S release notes. Many sites host a local mirror for performance and air-gap compliance.

**How do I stay fully reproducible?**  
Use environments, lockfiles (`spack.lock`), and `spack install -b only`. Pin compilers and SDK versions. Export your `spack.yaml` alongside your project.

---

### Summary

- Add the **E4S mirror**, **trust keys**, and **install with `-b auto`** for a smooth experience.
- For strict reproducibility, **use environments** and **`-b only`**.
- Match **OS/arch/compiler/SDK** to maximize binary reuse and avoid rebuilding from source.

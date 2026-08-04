---
layout: single
title: "Create a Local E4S Binary Cache"
permalink: /create-local-e4s-binary-cache/
classes: wide
sidebar:
  nav: "getmenu"
description: "Step-by-step guide to build E4S packages with Spack and publish binaries to your own build cache mirror."
---

{% include e4s-page-actions.html %}

This page describes how to create a **local, user-defined binary cache** for E4S-based builds. The workflow lets you define a package set in a Spack environment, build it, and publish signed binaries to your own mirror location for reuse by your team or site.

---

## Prerequisites

1. **Install Spack** and initialize your shell.
   ```bash
   git clone https://github.com/spack/spack.git
   . spack/share/spack/setup-env.sh
   spack -V
   ```

2. **Discover compilers** on your system.
   ```bash
   spack compiler find
   spack compilers
   ```

3. **Decide where your cache will live** (filesystem path or object storage URL).
   Examples:
   - Local/shared filesystem: `file:///sw/spack/mirror/e4s-local`
   - S3-style endpoint: `s3://my-e4s-cache`

4. **Create or obtain a GPG key** used to sign your binaries.
   ```bash
   spack gpg create "E4S Local Cache" "cache@example.org"
   spack gpg list
   ```

---

## Step 1 — Define the E4S package set in `spack.yaml`

Create a dedicated environment and list the products you want to provide from your local cache.

```bash
mkdir e4s-local-cache-env && cd e4s-local-cache-env
spack env activate -d .

cat > spack.yaml <<'YAML'
spack:
  specs:
  - hypre +mpi
  - petsc +mpi
  - kokkos +openmp
  concretizer:
    unify: true
  view: false
YAML
```

> Replace specs/variants/compilers with the exact E4S product selection needed at your site.

---

## Step 2 — Concretize and build

Concretize your environment and build all packages.

```bash
spack concretize -f
spack install
```

Validate what is now installed:

```bash
spack find -vl
```

---

## Step 3 — Configure your local binary mirror

Add your destination mirror and initialize indices.

```bash
export LOCAL_E4S_MIRROR="file:///sw/spack/mirror/e4s-local"   # change to your location
spack mirror add --scope=user e4s-local "${LOCAL_E4S_MIRROR}"
spack mirror list
```

---

## Step 4 — Push built binaries to your mirror

Publish binaries from your environment to your configured mirror.

```bash
# Push all concretized specs from the active environment
spack buildcache push --update-index e4s-local $(spack find --format '/{hash}')
```

If you want to push a subset, provide selected hashes or specs instead of all installed hashes.

---

## Step 5 — Consume your local cache from another environment

On another system or user environment, configure your mirror and trust signing keys:

```bash
spack mirror add --scope=user e4s-local "${LOCAL_E4S_MIRROR}"
spack buildcache keys --install --trust
```

Then install with cache preference:

```bash
spack install -b auto hypre +mpi
spack install -b only petsc +mpi
```

- `-b auto` prefers binaries and falls back to source.
- `-b only` requires binaries and fails if unavailable.

---

## Step 6 — Keep the cache updated for new E4S versions

For each new E4S-aligned stack update:

1. Update `spack.yaml` specs/versions/variants.
2. Re-run `spack concretize -f` and `spack install`.
3. Re-run `spack buildcache push --update-index ...`.

This incremental workflow lets you maintain a local cache-backed container or software stack tuned to your site needs.

---

## Common pitfalls

- **Missing binaries for a spec**: ABI tuple (OS/arch/compiler/SDK) differs from the build system.
- **Signature verification errors**: consumer does not trust the producer GPG key.
- **Unexpected source builds**: use `-b only` to enforce binary-only installs for validation.

---

### Summary

- Define your E4S package set in a Spack environment.
- Build once, then publish with `spack buildcache push`.
- Reuse those binaries from your own mirror with `-b auto` or `-b only` policies.

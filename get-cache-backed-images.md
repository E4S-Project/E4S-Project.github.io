---
layout: single
title: "Cache-Backed Images (CBIs)"
permalink: /cache-backed-images/
classes: wide
sidebar:
  nav: "getmenu"
description: "What a Cache-Backed Image is, why it removes the install barrier for scientific software, and why that matters for AI-for-science workflows."
---

{% include e4s-page-actions.html %}

_**A Cache-Backed Image turns "install and configure" into "pull and go."**_

A Cache-Backed Image (CBI) is a minimal container — just Spack and MPICH — that comes already pointed at the full E4S build cache. It doesn't carry the software; it carries the means to fetch any of it, already built and tested, on demand. The result: any of the hundreds of libraries, tools, and applications in E4S becomes available in real time, in full or à la carte, without a source build.

## Why It Matters

Scientific software is usually hard to install. A researcher who wants to try a new simulation code often spends hours — sometimes days — resolving compilers, libraries, and dependencies before running anything at all. That setup cost is a real barrier to entry, and it falls hardest on newcomers and on scientists whose expertise is in the science rather than the software.

A CBI removes that barrier. Because the image stays small and the build cache supplies everything else, an install that would normally take hours can complete in about a minute.

## Zero to LAMMPS in Two Minutes

On an ordinary laptop:

| Step | Time |
|---|---|
| Pull the E4S Cache-Backed Image (`ecpe4s/e4s-spack-cpu`) | 42 seconds |
| Install LAMMPS from the E4S build cache | 75 seconds |
| **Total: a fully functional, parallel LAMMPS simulation** | **under 2 minutes** |

That run used LAMMPS's standard Lennard-Jones melt benchmark — 32,000 atoms across 4 MPI ranks and 4 OpenMP threads each — and it wasn't a toy run: 17.5 million atom-timesteps per second, with no source build anywhere in the critical path.

## Why This Matters for AI-for-Science

Running a simulation is the entry point for a great many AI-for-science workflows — generating the training data behind a surrogate model, for instance. When the simulation step takes two minutes instead of two days, it changes what researchers are willing to attempt. A CBI turns simulation from a multi-day setup project into something you can fold into an afternoon of experimentation: spin up the environment, generate training data, iterate, and tear it down, without ever compiling anything from source.

## Consistent from Laptop to Leadership-Class Systems

The same CBI runs unchanged on a laptop, in the cloud, and on leadership-class HPC systems. Because E4S publishes curated, versioned releases, a container tag plus a Spack specification is enough to reconstruct the exact software environment behind a published result — the same image and cache that produced a two-minute LAMMPS run on a laptop is the one that scales to a full simulation campaign.

CBIs are available for all major CPU and GPU platforms.

## Getting Started

- Try it yourself: the [E4S Quick Start](/quick-start/) walks through the same steps shown above — pull the image, supply code, launch, compile and run — with the [E4S Guide Bot](/guide-e4s-bot/) available for questions along the way.
- Browse available CBIs (CPU, CUDA, ROCm, OneAPI variants) on the [Container Download page](/container-download/#cache-backed-images-cbis).
- Learn more about the build cache that backs every CBI: [Use the E4S Spack Build Cache](/e4s-buildcache/).

---

*The Zero-to-LAMMPS benchmark above was developed as part of the [PESO project](https://pesoproject.org) (Partnering for Scientific-software Ecosystem Stewardship Opportunities).*

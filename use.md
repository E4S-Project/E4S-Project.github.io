---
layout: single
title: Use E4S
permalink: /use/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

E4S offers multiple methods for deploying its collection of HPC and AI software packages. Below is an overview of these deployment options. Additional documentation is available from the side menu.

|Use Option | Description |
|-----------|-------------|
| From-Source Builds | E4S utilizes [Spack](https://spack.io), a flexible package manager, to facilitate building software directly from source. This allows users to customize builds for their specific systems. Instructions: [General Spack usage instructions](/spack-installation/) for installing individual products. [E4S-specific Installation Guide](/spack-e4s-installation/) for working with Spack and E4S. |
| Spack Build Cache | Pre-built binaries provided via Spack build caches enable faster installations without local compilation. More information available on the [E4S Buildcache Page](/e4s-buildcache/). |
| Containers | E4S offers containerized versions of its software stack, compatible with Docker, Singularity, Shifter, and CharlieCloud. See the [Container Download Page](/container-download/) for available containers. See side menu for additional container information. |
| Commercial Cloud Options |E4S containers are  available via [ParaTools Pro for E4S™](https://paratoolspro.com), including [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-ozpychswxmldi). E4S can be deployed on Amazon Web Services (AWS) for scalable cloud-based HPC/AI workloads and Google Cloud Platform (GCP) with access to high-performance VMs and storage. |
| Test using E4S | E4S can be used for upstream or downstream testing of your own software products. For example, if you produce compilers or tools for HPC-AI users, E4S can be a reasonable proxy for the HPC-AI user community.  See [Test with E4S](/test-with-e4s/) for more details.|

---
layout: single
title: "E4S Development Process"
permalink: /development-process/
classes: wide
sidebar:
  nav: "joinmenu"
---

{% include e4s-page-actions.html %}

## Overview

The E4S development process ensures that scientific software products are integrated, tested, and maintained in a consistent, portable, and reproducible manner across diverse high-performance computing environments. E4S releases are built around community collaboration, rigorous testing, and continuous improvement of the curated software ecosystem.

E4S provides two major releases each year, labeled as **E4S XX.YY**, where **XX** is the two-digit year and **YY** is the two-digit month. These releases are aligned with the U.S. Supercomputing Conference (SC) and the International Supercomputing Conference (ISC), ensuring that the E4S stack is synchronized with leading HPC and AI research events. Between these major releases, E4S continues to integrate and validate new packages, maintaining an active and evolving ecosystem.

---

## Initial Integration Efforts and Support

| Topic | Description |
|-------|--------------|
| Package onboarding | New packages are considered for inclusion based on their relevance, maturity, portability, and community support. Candidate products undergo a review process to ensure alignment with E4S goals and compatibility with its infrastructure. |
| Spack package development | E4S teams assist product developers in creating and refining their Spack recipes. This ensures each product can be built reproducibly across target systems and architectures. |
| Build and dependency validation | Each new product undergoes dependency analysis and compatibility checks within the Spack environment to confirm interoperability with other E4S components. |
| Initial testing on E4S CI systems | Candidate products are tested using E4S continuous integration pipelines to confirm successful builds on common platforms before being promoted to pre-release builds. |
| Documentation and metadata integration | Contributors are guided to provide clear documentation, metadata, and versioning information, allowing seamless integration into the E4S product catalog and build infrastructure. |

---

## Ongoing Support and Testing

| Topic | Description |
|-------|--------------|
| Scheduled E4S releases | E4S produces two major releases annually—typically aligned with the ISC (June) and SC (November) conferences. Each release provides an updated bundle of interoperable packages validated on multiple HPC systems. |
| Between-release updates | Between major releases, new and updated packages are integrated and tested as part of continuous improvement efforts, ensuring rapid adoption of advances in compilers, SDKs, and hardware architectures. |
| Continuous integration and regression testing | E4S employs automated build and test pipelines for early detection of regressions and configuration issues across a wide variety of compilers, platforms, and environments. |
| Cross-architecture validation | E4S tests are performed on x86, ARM, Power, and GPU architectures (NVIDIA, AMD, and Intel) to confirm consistent functionality and performance across vendor ecosystems. |
| Community and developer support | E4S teams provide technical assistance, best-practice guidance, and troubleshooting help to member projects, supporting long-term stability and collaboration within the ecosystem. |

---

## Testing Resources

| Resource | Description |
|-----------|--------------|
| Frank CI system | The E4S continuous integration system, named Frank, supports automated builds and testing for dozens of packages across diverse architectures and SDKs. |
| Hardware diversity | Frank provides access to the latest CPUs and GPUs, including NVIDIA, AMD, and Intel devices, enabling comprehensive multi-platform validation. |
| Software development kits (SDKs) | The testing environment includes vendor SDKs and compilers such as CUDA, ROCm, and oneAPI, ensuring compatibility with major HPC hardware ecosystems. |
| Container and virtual environments | Testing includes containerized builds using E4S base images to ensure reproducibility and portability across environments like Docker, Singularity, and Apptainer. |
| Continuous improvement of infrastructure | The E4S CI team continually enhances testing workflows, adding new test coverage, build caches, and validation pipelines as technologies evolve. |

---

E4S development is a collaborative and evolving process designed to foster a thriving ecosystem of interoperable, high-performance scientific software. Through structured integration, rigorous testing, and robust infrastructure, E4S ensures that every release provides a dependable foundation for scientific discovery and innovation.

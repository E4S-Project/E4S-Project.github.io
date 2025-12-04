---
layout: single
title:  "Use E4S containers or not?"
permalink: /about-e4s-containers/
classes: wide
sidebar:
  nav: "aboutmenu"
---

{% include e4s-page-actions.html %}


Scientific computing users find containers attractive for many reasons.  A simple approach is to download a basic container images, install Spack and then further install any other software products you need.  However, you might consider using E4S containers instead.  This page helps you think through that decision by comparing when each option makes sense and highlighting some of the hidden long-term risks.

E4S containers are curated, tested, and maintained by a community focused on high-performance scientific applications. They include Spack, hundreds of pre-installed packages, and configuration settings that match typical HPC environments. By contrast, general-purpose Linux containers offer more flexibility and minimalism, but require more manual effort and expertise to get things right.

The following tables outline the main considerations.

## When E4S containers are a good option

| Reason | Discussion |
|--------|------------|
| Aligned with scientific computing stacks | E4S containers include software stacks optimized for HPC applications, such as MPI implementations, GPU libraries, compilers, and performance tools. |
| Reduced setup time | These containers provide prebuilt software stacks via Spack, saving users from needing to build everything from scratch. |
| Strong support for reproducibility | E4S containers are versioned and include package manifests and metadata to help reproduce builds across systems. |
| Designed for portability | E4S containers work across laptops, clusters, and supercomputers, ensuring a consistent user environment across platforms. |
| Better for onboarding new users | For teams with diverse experience, E4S containers offer a stable and uniform baseline that simplifies training and troubleshooting. |
| Community-tested and validated | Containers are built and tested by the E4S team across many platforms and facilities, increasing trust in the configuration. |

## When any general Linux container with Spack might be better

| Reason | Discussion |
|--------|------------|
| You want minimal size | E4S containers may include more than you need. A stripped-down Linux base with Spack lets you include only required packages. |
| You need a highly customized setup | Some applications or workflows may need specific OS versions, compilers, or system libraries not available in E4S containers. |
| You already have a company-standard base image | Organizations may require specific base images for compatibility, security, or compliance reasons. |
| You want full control over your build stack | Building from scratch allows for deep optimization, version pinning, or experimental setups not supported by E4S. |

## Long-term risks that E4S can address

| Reason | Discussion |
|--------|------------|
| Reproducibility issues | A custom container may work on your laptop but fail on HPC systems due to subtle environment mismatches. |
| Compatibility headaches | Without tested combinations of packages, you may encounter build or runtime errors that are hard to debug. |
| Duplication of effort | Rebuilding libraries that already exist in E4S wastes time and increases maintenance burden. |
| Performance penalties | If you don't tune MPI, GPU drivers, or compiler flags correctly in a custom container, you may get poor performance. |
| Onboarding friction | If team members or collaborators use inconsistent container setups, debugging and collaboration become difficult. |
| Support limitations | Community support is easier to get when using standard E4S containers, while custom setups may fall outside common experience. |

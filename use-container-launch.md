---
layout: single
title: "E4S-CL"
permalink: /container-launch/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

### E4S container management tool: E4S-CL

E4S Container Launch is an effort to facilitate the use of MPI applications developed using E4S containers on supercomputers without having to compile a new binary on the host.

Given a combination of an MPI library, a container and a MPI binary, E4S Container Launch will run the MPI binary in the target container using the MPI library. This is useful when the binary has been compiled using a different library than the one passed as an argument: as long as the two libraries are [ABI compatible](https://www.mpich.org/abi/), the binary will run under the new environment.

E4S Container Launch includes tools to automatically detect the MPI binary\'s necessary files, making it seamless to set up and use.

The source code is available at the [E4S-CL GitHub repository](https://github.com/E4S-Project/e4s-cl). The documentation is also available [here](https://e4s-cl.readthedocs.io/en/latest/).

### E4S-CL demo video:

[YouTube demo video](https://www.youtube.com/embed/6eZflZpHldk)

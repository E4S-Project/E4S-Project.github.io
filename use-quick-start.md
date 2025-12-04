---
layout: single
title: "E4S Quick Start"
permalink: /quick-start/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}


The instructions on this page show how to build and run a simple MPI program using an **E4S base container** available from [DockerHub](https://hub.docker.com).

{% include e4s-card-style.html %}

{% include e4s-two-card-content.html
   card1_title="Step 1: Docker Image"
   card1_front_text="Download E4S base image ecpe4s/ubuntu20.04"
   card1_back_text="This Ubuntu 20.04 image has Spack, MPI, and a few other packages pre-installed, useful for a quick start."
   card2_title="Step 2: MPI Code"
   card2_front_text="Produce an MPI example code, your code or the example below."
   card2_back_text="The code below performs a simple ping-pong test on two MPI processes, or you can provide your own example code."
%}

{% include e4s-two-card-content.html
   card1_title="Step 3: Run container"
   card1_front_text="Run the container in interactive mode, obtaining a command prompt."
   card1_back_text="Interactive mode provides you with command line access to an E4S-enabled Linux machine."
   card2_title="Step 4: Compile and run code"
   card2_front_text="Load MPI using Spack, compile your code and run it!"
   card2_back_text="The E4S container has Spack and MPI pre-installed, with all other E4S products readily available."
%}

{% include e4s-card-script.html %}

---

# Getting Started with MPI Using the E4S Base Container  
### (Docker Desktop on macOS or Linux)

This short guide walks you through four simple conceptual steps to run an MPI program inside an E4S container using the **ecpe4s/ubuntu20.04** base image.  
The process is portable, reproducible, and works on any system running Docker Desktop.

---

## **1. Download the E4S Base Image**

Pull the E4S base container:

```bash
docker pull ecpe4s/ubuntu20.04:latest
```

Verify the image exists locally:

```bash
docker images ecpe4s/ubuntu20.04
```

---

## **2. Create a Simple MPI Example**

Create a working directory:

```bash
mkdir ~/mpi-test
cd ~/mpi-test
```

Create an MPI source file named `pingpong.c`:

```c
#include <mpi.h>
#include <stdio.h>

int main(int argc, char **argv) {
    int rank, tag = 0;
    char msg = 'x';
    MPI_Status status;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    for (int i = 0; i < 10; i++) {
        if (rank == 0) {
            MPI_Send(&msg, 1, MPI_CHAR, 1, tag, MPI_COMM_COMM_WORLD);
            MPI_Recv(&msg, 1, MPI_CHAR, 1, tag, MPI_COMM_WORLD, &status);
            printf("Iteration %d: Rank 0 received pong\n", i);
        } else if (rank == 1) {
            MPI_Recv(&msg, 1, MPI_CHAR, 0, tag, MPI_COMM_WORLD, &status);
            MPI_Send(&msg, 1, MPI_CHAR, 0, tag, MPI_COMM_WORLD);
            printf("Iteration %d: Rank 1 sent pong\n", i);
        }
    }

    MPI_Finalize();
    return 0;
}
```

---

## **3. Run the Container in Interactive Mode**

Use Docker Desktop to start an interactive shell inside the E4S container:

```bash
docker run -it --rm \
    -v $PWD:/work \
    -w /work \
    ecpe4s/ubuntu20.04:latest /bin/bash
```

Verify your source file is visible:

```bash
ls
```

Expected output:

```
pingpong.c
```

---

## **4. Load MPI Using Spack, Compile, and Run!**

Inside the container:

### Load an MPI implementation:

```bash
spack load mpich
```

Verify the MPI compiler is available:

```bash
mpicc --version
```

### Compile your MPI program:

```bash
mpicc -O2 -o pingpong pingpong.c
```

### Run the MPI application:

```bash
mpirun -n 2 ./pingpong
```

You should see output showing message exchange between rank 0 and rank 1.

---

# 🎉 Congratulations!

You now have a complete MPI workflow running inside an E4S container:

- E4S base image downloaded  
- MPI program created  
- Interactive container session started  
- MPI loaded via Spack, compiled, and executed  

---
layout: single
title: "LAMMPS Quick Start"
permalink: /quick-start-lammps/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

The instructions on this page show how to run a simple LAMMPS molecular dynamics example using an E4S base container from DockerHub.

{% include e4s-card-style.html %}

{% include e4s-two-card-content.html
   card1_title="Step 1: Docker Image"
   card1_front_text="Download E4S base image ecpe4s/e4s-spack-cpu."
   card1_back_text="This image includes Spack and MPI, making it a strong starting point for installing LAMMPS."
   card2_title="Step 2: Run Container"
   card2_front_text="Start an interactive container session."
   card2_back_text="Mount your working directory so your input script and outputs persist on your host machine."
%}

{% include e4s-two-card-content.html
   card1_title="Step 3: Install and Load LAMMPS"
   card1_front_text="Use Spack to install and load LAMMPS."
   card1_back_text="Spack resolves dependencies and prepares your environment for running the executable."
  card2_title="Step 4: Create Input File"
  card2_front_text="Create a simple LAMMPS input script."
  card2_back_text="Use cat > in.lj to create the script, then run it in the next step."
%}

{% include e4s-two-card-content.html
  card1_title="Step 5: Run Example"
  card1_front_text="Execute the LAMMPS simulation with mpirun."
  card1_back_text="The sample runs a short Lennard-Jones simulation and prints thermodynamic output."
  card2_title="What You Learn"
  card2_front_text="Understand the end-to-end workflow."
  card2_back_text="Container setup, Spack install/load, script creation, and simulation execution."
%}

{% include e4s-card-script.html %}

---

# Getting Started with LAMMPS Using the E4S Base Container
### (Docker Desktop on macOS or Linux)

This short guide walks you through a complete LAMMPS beginner workflow.

---

## 1. Download the E4S Base Image

Pull the E4S base container:

```bash
docker pull ecpe4s/e4s-spack-cpu:latest
```

Optional check:

```bash
docker images ecpe4s/e4s-spack-cpu
```

---

## 2. Run the Container in Interactive Mode

Create a working directory:

```bash
mkdir -p ~/lammps-quickstart
cd ~/lammps-quickstart
```

Start an interactive shell inside the container:

```bash
docker run -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-spack-cpu:latest
```

You are now inside the container.

---

## 3. Install and Load LAMMPS with Spack

Inside the container, load MPI:

```bash
spack load mpich
```

Install LAMMPS (this can take several minutes):

```bash
spack install lammps +mpi ^mpich
```

Load LAMMPS:

```bash
spack load lammps +mpi ^mpich
```

Confirm loaded packages:

```bash
spack find --loaded
```

Locate the LAMMPS executable:

```bash
LAMMPS_EXE=$(command -v lmp || command -v lmp_mpi)
echo "$LAMMPS_EXE"
```

---

## 4. Create a Simple LAMMPS Input File

Create a file named `in.lj`.

You can do this with an editor, or directly in the terminal using:

```bash
cat > in.lj
```

Then paste the following input and press Ctrl-D to save:

```lammps
units           lj
atom_style      atomic
boundary        p p p

lattice         fcc 0.8442
region          box block 0 4 0 4 0 4
create_box      1 box
create_atoms    1 box
mass            1 1.0

pair_style      lj/cut 2.5
pair_coeff      1 1 1.0 1.0 2.5

neighbor        0.3 bin
neigh_modify    every 1 delay 0 check yes

velocity        all create 1.0 87287
fix             1 all nve

timestep        0.005
thermo          10
run             100
```

## 5. Run the Example

Run the simulation on one MPI rank:

```bash
mpirun -n 1 "$LAMMPS_EXE" -in in.lj
```

Expected output includes thermodynamic columns such as Step, Temp, TotEng, and Press.

---

# What You Learned

- How to use an E4S base container for a reproducible LAMMPS environment
- How to install and load LAMMPS with Spack
- How to run a simple molecular dynamics input script

Next, you can try larger systems, more timesteps, and multiple MPI ranks.

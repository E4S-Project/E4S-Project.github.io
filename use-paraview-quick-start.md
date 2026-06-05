---
layout: single
title: "ParaView Quick Start"
permalink: /quick-start-paraview/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

The instructions on this page show how to run a simple ParaView example using an E4S base container from DockerHub.

{% include e4s-card-style.html %}

{% include e4s-two-card-content.html
   card1_title="Step 1: Docker Image"
   card1_front_text="Download E4S base image ecpe4s/e4s-spack-cpu."
   card1_back_text="This image includes Spack and MPI, making it a strong starting point for installing ParaView."
   card2_title="Step 2: Run Container"
   card2_front_text="Start an interactive container session."
   card2_back_text="Mount your working directory so your script and outputs persist on your host machine."
%}

{% include e4s-two-card-content.html
   card1_title="Step 3: Install and Load ParaView"
   card1_front_text="Use Spack to install and load ParaView."
   card1_back_text="Spack resolves dependencies and prepares your environment for pvpython and other ParaView tools."
   card2_title="Step 4: Create Example Script"
   card2_front_text="Create a simple ParaView Python script."
   card2_back_text="Use cat > pv_wavelet.py to build a minimal example pipeline."
%}

{% include e4s-two-card-content.html
   card1_title="Step 5: Run Example"
   card1_front_text="Execute the script with pvpython."
   card1_back_text="The script creates synthetic data and writes a VTK output file."
   card2_title="Step 6: View Output"
   card2_front_text="Open the generated file in ParaView."
   card2_back_text="Use ParaView on your host machine to inspect the wavelet.vti dataset."
%}

{% include e4s-card-script.html %}

---

# Getting Started with ParaView Using the E4S Base Container
### (Docker Desktop on macOS or Linux)

This short guide walks you through a complete ParaView beginner workflow.

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
mkdir -p ~/paraview-quickstart
cd ~/paraview-quickstart
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

## 3. Install and Load ParaView with Spack

Inside the container, load MPI:

```bash
spack load mpich
```

Install ParaView (this can take several minutes):

```bash
spack install paraview +mpi ^mpich
```

Load ParaView:

```bash
spack load paraview +mpi ^mpich
```

Confirm loaded packages:

```bash
spack find --loaded
```

Confirm ParaView Python is available:

```bash
pvpython --version
```

---

## 4. Create a Simple ParaView Example Script

Create a file named `pv_wavelet.py`.

You can do this with an editor, or directly in the terminal using:

```bash
cat > pv_wavelet.py
```

Then paste the following code and press Ctrl-D to save:

```python
from paraview.simple import Wavelet, SaveData

source = Wavelet()
SaveData("wavelet.vti", proxy=source)

print("Wrote wavelet.vti")
```

## 5. Run the Example

Run the script:

```bash
pvpython pv_wavelet.py
```

Verify the output file exists:

```bash
ls -lh wavelet.vti
```

Expected output includes:

```text
Wrote wavelet.vti
```

## 6. View the Output File

Exit the container shell:

```bash
exit
```

If your host does not already have ParaView installed, choose one of these options:

- macOS (Homebrew):

```bash
brew install --cask paraview
```

- Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y paraview
```

- Windows (winget in PowerShell):

```powershell
winget install Kitware.ParaView
```

- Any platform: download an official binary package from https://www.paraview.org/download/

On your host machine, start ParaView and open the generated file:

```bash
paraview wavelet.vti
```

In the ParaView UI:

1. Click Apply in the Properties panel.
2. Use the coloring dropdown to color by RTData.
3. Rotate/zoom to inspect the dataset.

---

# What You Learned

- How to use an E4S base container for a reproducible ParaView environment
- How to install and load ParaView with Spack
- How to run a simple ParaView Python example, generate output data, and view it

Next, you can extend the script with filters such as Contour, Clip, and Slice.

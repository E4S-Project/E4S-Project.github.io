---
layout: single
title: "E4S Quick Start"
permalink: /quick-start/
classes: wide
sidebar:
  nav: "usemenu"
---


The instructions on this page show how to build and run a simple MPI program using an **E4S base container** available from [DockerHub](https://hub.docker.com).


<style>
.btn--oval-blue {
  display: inline-block;
  background-color: #0092CA;
  color: white !important;
  padding: 0.6em 1.5em;
  border-radius: 999px; /* makes it oval */
  text-decoration: none;
  font-weight: 600;
  transition: background-color 0.3s ease, transform 0.2s ease;
}
.btn--oval-blue:hover {
  background-color: #0078a8;
  transform: translateY(-2px);
}

.feature-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}

/* Card shell */
.feature-item {
  --card-h: auto;           /* will be filled by JS per card */
  background: #f8f9fa;
  border-radius: 12px;
  text-align: center;
  padding: 0;               /* faces hold padding */
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: box-shadow 0.2s ease;
  position: relative;
  perspective: 1000px;
  cursor: pointer;
  height: var(--card-h, auto);
  min-height: 240px;        /* safety floor, gets overridden once sized */
}

/* Rotating inner wrapper */
.feature-item .card-inner {
  position: relative;
  width: 100%;
  height: 100%;             /* match computed height */
  transform-style: preserve-3d;
  transition: transform 0.6s;
  border-radius: 12px;
}

/* Faces */
.feature-item .card-front,
.feature-item .card-back {
  position: absolute;
  inset: 0;
  border-radius: 12px;
  padding: 1.5rem;
  backface-visibility: hidden;
  overflow: auto;           /* scroll if needed */
}

/* Front preserves original design */
.feature-item .card-front {
  background: #f8f9fa;
}

/* Back */
.feature-item .card-back {
  background: #eaf5fb;
  text-align: left;
  transform: rotateY(180deg);
}

/* Desktop hover lift */
@media (hover: hover) {
  .feature-item:hover {
    box-shadow: 0 6px 10px rgba(0,0,0,0.12);
  }
}

/* Flip triggers */
.feature-item.flipped .card-inner {
  transform: rotateY(180deg);
}
@media (hover: hover) {
  .feature-item:hover .card-inner {
    transform: rotateY(180deg);
  }
}

/* Original icon/typography */
.feature-item svg {
  width: 64px;
  height: 64px;
  margin-bottom: 10px;
  stroke: #0092CA;
  stroke-width: 1.8;
  fill: none;
}
.feature-item h3 {
  color: #0092CA;
  font-size: 1.25rem;
  margin-bottom: 0.5rem;
}
.feature-item p {
  font-size: 0.95rem;
  color: #444;
}

/* Back button */
.feature-item .flip-back {
  margin-top: 1rem;
  padding: 0.3rem 0.6rem;
  border: none;
  border-radius: 4px;
  background-color: #0092CA;
  color: white;
  cursor: pointer;
}
.feature-item .flip-back:hover {
  background-color: #0078a8;
}

/* Measurement mode (temporarily disables abs positioning to read natural heights) */
.feature-item.measuring .card-front,
.feature-item.measuring .card-back {
  position: static !important;
  transform: none !important;
  display: block !important;
  box-shadow: none !important;
  backface-visibility: visible !important;
}
/* Second feature row styling */
.feature-row-botcatalog {
  margin-top: 2.5rem;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}

.static-card {
  background: #f8f9fa;
  border-radius: 12px;
  text-align: center;
  padding: 1.5rem;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.static-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 6px 10px rgba(0,0,0,0.12);
}

.static-card svg {
  width: 64px;
  height: 64px;
  margin-bottom: 10px;
  stroke: #0092CA;
  stroke-width: 1.8;
  fill: none;
}

.static-card h3 {
  color: #0092CA;
  font-size: 1.25rem;
  margin-bottom: 0.5rem;
}

.static-card p {
  font-size: 0.95rem;
  color: #444;
}
</style>

<div class="feature-grid">

<!-- 1 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <h3>Step 1: Docker Image</h3>
      <p>Download E4S base image ecpe4s/ubuntu20.04</p>
    </div>
    <div class="card-back">
      <p>This Ubuntu 20.04 image has Spack, MPI, and a few other package pre-installed, useful for quick start</p>
    </div>
  </div>
</div>

<!-- 2 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <h3>Step 2: MPI Code</h3>
      <p>Produce an MPI example code, your code or the example below </p>
    </div>
    <div class="card-back">
      <p>The code below performs a simple ping-pong test on two MPI processes, or you can provide your own example code</p>
    </div>
  </div>
</div>
</div>

<div class="feature-grid">

<!-- 3 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <h3>Step 3: Run container</h3>
      <p>Run the container in interactive mode, obtaining a command prompt</p>
    </div>
    <div class="card-back">
      <p>Interactive mode provides you with command line access to an E4S-enabled Linux machine</p>
    </div>
  </div>
</div>

<!-- 4 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <h3>Step 4: Compile and run code</h3>
      <p>Load MPI using Spack, compile your code and run it!</p>
    </div>
    <div class="card-back">
      <p>The E4S container has Spack and MPI pre-installed, all other E4S products readily available</p>
    </div>
  </div>
</div>

</div>

<script>
// Flip behavior: touch devices tap; desktop hover handled by CSS
document.querySelectorAll('.feature-item').forEach(item => {
  const backButton = item.querySelector('.flip-back');
  item.addEventListener('click', e => {
    if (!window.matchMedia('(hover:hover)').matches) {
      if (!e.target.classList.contains('flip-back')) item.classList.toggle('flipped');
    }
  });
  if (backButton) {
    backButton.addEventListener('click', e => {
      e.stopPropagation();
      item.classList.remove('flipped');
    });
  }
});

/* ---- Auto-size each card to its tallest face ----
   Measures natural heights (front & back), sets --card-h per card,
   and re-measures on load/resize/grid reflow.
*/
function sizeCards() {
  const items = document.querySelectorAll('.feature-item');
  if (!items.length) return;

  items.forEach(item => {
    // put card in "measuring" mode so faces flow naturally
    item.classList.add('measuring');
    // clear previous height so we can measure natural height
    item.style.setProperty('--card-h', 'auto');

    const front = item.querySelector('.card-front');
    const back  = item.querySelector('.card-back');

    // read natural heights
    const hFront = front ? front.scrollHeight : 0;
    const hBack  = back  ? back.scrollHeight  : 0;

    // choose the tallest + a tiny buffer
    const h = Math.max(hFront, hBack, 240) + 2;

    // apply height to the card
    item.style.setProperty('--card-h', h + 'px');

    // leave measuring mode
    item.classList.remove('measuring');
  });
}

// Recompute on load, after fonts, and on resize
window.addEventListener('load', sizeCards);
window.addEventListener('resize', () => { sizeCards(); });

// Recompute when the grid layout changes size (e.g., responsive columns)
const grid = document.querySelector('.feature-grid');
if (window.ResizeObserver && grid) {
  const ro = new ResizeObserver(() => sizeCards());
  ro.observe(grid);
}

// If content/fonts load late in Minimal-Mistakes, a small post-load nudge helps
setTimeout(sizeCards, 300);
</script>

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

---
layout: single
title: "Math Libraries Guide"
permalink: /guide-mathlibs/
classes: wide
sidebar:
  nav: "botmenu"
---

<p style="text-align:center;">
    Construct your prompt from the instructions below then use the E4S Guide Bot
</p>
{% include e4s-bot-button.html %}

# Introduction

Mathematical libraries are the foundation of most scientific computing applications. They provide optimized, scalable implementations of key algorithms such as solvers, transforms, and discretizations that allow applications to leverage the performance of modern hardware while maintaining numerical accuracy and reproducibility.

When selecting a math library from the E4S ecosystem, users should consider their problem domain, the computational architecture they target, and the development and runtime environments in which they operate. The following attributes can help newcomers and experienced developers alike identify which math library (or combination of libraries) best fits their needs.

> Example prompt:  
> "I am developing a simulation that requires solving large sparse linear systems on NVIDIA GPUs using mixed-precision arithmetic. The code is written in C++ and must support MPI-based distributed memory parallelism. Suggest E4S math libraries that provide GPU-accelerated solvers and support mixed precision."

---

## Broadly Meaningful Attributes for Math Libraries

| Attribute | Description |
|------------|-------------|
| Problem type | The mathematical problem addressed, such as linear systems, eigenvalue problems, nonlinear equations, optimization, or PDEs. |
| Current library use | Listing libraries you already use can influence advice to use compatible libraries. |
| Data structure support | Types of data layouts and structures supported (dense, sparse, block, hierarchical, etc.). |
| Precision support | Floating-point and mixed-precision capabilities (e.g., FP64, FP32, BF16, FP16). |
| Parallelism model | Types of parallel execution supported (MPI, OpenMP, CUDA, HIP, SYCL, Kokkos, etc.). |
| Portability | Ability to run across different architectures (CPU, GPU, manycore, etc.) and vendors (NVIDIA, AMD, Intel). |
| Language bindings | Programming languages supported (C, C++, Fortran, Python). |
| Numerical robustness | Degree of numerical stability, accuracy, and tolerance to ill-conditioned systems. |
| Scalability | Ability to scale efficiently on many nodes and GPUs. |
| Performance portability | Support for tuned kernels and auto-tuning across platforms. |
| Composability | Ease of integration with other libraries, frameworks, or application layers. |
| Licensing | Open-source license type and implications for use. |
| Community support | Availability of documentation, user forums, and active development. |
| E4S integration level | Degree of integration and testing within E4S releases (core, optional, experimental). |

---

## Situation-Specific Attributes for Math Libraries

### Linear Solvers

| Attribute | Description |
|------------|-------------|
| Matrix type | Sparse, dense, structured, or unstructured matrices supported. |
| Solver method | Direct, iterative (Krylov), multigrid, or hybrid methods. |
| Preconditioners | Availability of preconditioners such as ILU, Jacobi, AMG. |
| GPU acceleration | Availability of GPU-enabled solver implementations. |
| Mixed-precision support | Ability to use different precisions for performance or energy efficiency. |

### Eigensolvers

| Attribute | Description |
|------------|-------------|
| Problem type | General, symmetric, or Hermitian eigenproblems. |
| Spectrum range | Targeted portion of the spectrum (smallest, largest, interior). |
| Scalability | Performance for large-scale distributed eigenproblems. |
| Algorithm type | Davidson, Lanczos, Krylov-Schur, or other methods. |

### Nonlinear Solvers

| Attribute | Description |
|------------|-------------|
| Solver strategy | Newton-based, quasi-Newton, trust-region, or fixed-point. |
| Jacobian computation | Analytic, automatic differentiation, or finite difference. |
| Line search and globalization | Methods for improving convergence stability. |

### DAE/ODE Solvers

| Attribute | Description |
|------------|-------------|
| Problem type | Ordinary (ODE), differential-algebraic (DAE), or stiff/nonstiff systems. |
| Integration methods | Runge–Kutta, BDF, Adams–Moulton, or Rosenbrock schemes. |
| Adaptive control | Time-step adaptivity and error estimation. |
| Sensitivity analysis | Support for derivative and adjoint methods. |

### Optimization Solvers

| Attribute | Description |
|------------|-------------|
| Problem type | Linear, nonlinear, convex, or stochastic optimization. |
| Constraints | Support for bound, equality, and inequality constraints. |
| Gradient/Hessian support | Use of analytic, automatic, or approximated derivatives. |
| Parallel capabilities | Distributed-memory or GPU-enabled optimization routines. |

### Meshing, Discretization, and AMR

| Attribute | Description |
|------------|-------------|
| Mesh type | Structured, unstructured, or hybrid meshes supported. |
| Discretization method | Finite element, finite volume, finite difference, or spectral. |
| Adaptivity | Support for adaptive mesh refinement and error-based refinement. |
| Geometry handling | Curvilinear or high-order geometric representations. |
| Coupling | Ability to integrate with solver libraries and I/O formats. |

### Stochastic and Advanced Capabilities

| Attribute | Description |
|------------|-------------|
| Randomization | Support for randomized algorithms and Monte Carlo methods. |
| Uncertainty quantification | Integration with UQ frameworks or polynomial chaos. |
| Surrogate modeling | Use of reduced-order or data-driven surrogate models. |
| Multi-physics coupling | Ability to link to external solvers for coupled systems. |

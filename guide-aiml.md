---
layout: single
title: "E4S AI & Machine Learning Guide"
permalink: /guide-aiml/
classes: wide
sidebar:
  nav: "botmenu"
---


{% include e4s-page-actions.html %}

<p style="text-align:center;">
    Construct your prompt from the instructions below then use the E4S Guide Bot
</p>
{% include e4s-bot-button.html %}


## Introduction

Artificial Intelligence (AI) and Machine Learning (ML) are rapidly evolving areas that increasingly intersect with high-performance computing (HPC). Within the E4S ecosystem, AI/ML tools are selected and supported to provide scalable, portable, and sustainable foundations for scientific discovery. These tools range from industry-standard frameworks such as TensorFlow and PyTorch, to specialized scientific and workflow-oriented environments like DeepHyper, LBANN, and SmartSim.

Selecting the right AI/ML library or tool depends on understanding both the **characteristics of your problem** and the **environment in which you will develop and run it**. E4S provides a curated set of interoperable, performance-tuned AI/ML products, making it easier for researchers to combine familiar AI workflows with HPC architectures.  

> **Example:**
> I am training a deep neural network to emulate a climate simulation model.  
> My data are multi-dimensional arrays stored in HDF5 format, generated from HPC simulations.  
> The training will run on a large GPU-based supercomputer that uses NVIDIA A100 devices and MPI for distributed communication.  
> I want to use mixed-precision training for better performance but need high numerical accuracy during validation.  
> The model should be exportable to ONNX for inference on different systems.  
> I also need to perform hyperparameter optimization across hundreds of nodes using the batch scheduler.  
> Please suggest which AI/ML libraries or tools in E4S are best suited for this task, and explain why.

The following tables outline attributes that can help a newcomer — or an automated assistant — reason about which AI/ML tools best fit a given use case. These attributes are divided into broadly meaningful attributes and those specific to certain situations.

---


## Broadly Meaningful Attributes

| Attribute | Description |
|------------|--------------|
| Primary goal | The main purpose of the AI/ML task, such as training, inference, surrogate modeling, or reinforcement learning. |
| Data modality | The type of data used, such as image, text, tabular, time series, graph, or multi-modal combinations. |
| Computational scale | The size and complexity of the workload, ranging from single-node prototyping to large-scale distributed training across supercomputers. |
| Hardware targets | The intended hardware platform(s), such as CPU, NVIDIA GPU, AMD GPU, Intel GPU, or other accelerators. |
| Precision requirements | The numeric precision(s) used during training or inference (e.g., FP64, FP32, BF16, FP8) and support for mixed or adaptive precision. |
| Framework interoperability | Compatibility with major frameworks such as PyTorch, TensorFlow, JAX, or ONNX. |
| HPC integration | Availability of MPI, NCCL, RCCL, oneCCL, or other communication libraries for distributed computation. |
| Portability | The ability to run effectively on different architectures and compilers through abstractions like Kokkos or SYCL. |
| Licensing and support model | Type of license (e.g., open-source, permissive, copyleft) and level of community or vendor support. |
| Maturity and adoption | Stability, user base, and long-term support within the E4S or broader scientific community. |
| Ease of use | The learning curve and availability of documentation, examples, and APIs. |
| Extensibility | The ability to integrate custom operators, solvers, or domain-specific modules. |
| Workflow integration | Compatibility with workflow tools (e.g., SmartSim, DeepHyper, or MLFlow) and data pipelines in HPC environments. |

---

## Situation-Specific Attributes

### For Training Deep Neural Networks

| Attribute | Description |
|------------|--------------|
| Parallelism model | Supported training parallelism types: data, model, pipeline, or hybrid. |
| Gradient synchronization | Methods used for distributed optimization (e.g., AllReduce, parameter server, decentralized). |
| Checkpointing | Capabilities for saving and restoring training state efficiently at scale. |
| Data loading | Support for streaming or parallel I/O with HPC file systems. |
| Mixed precision optimization | Automatic handling of reduced-precision arithmetic for speed and memory efficiency. |

### For Inference and Deployment

| Attribute | Description |
|------------|--------------|
| Latency sensitivity | Acceptable inference delay (e.g., real-time, batch, or offline processing). |
| Model format | Supported model export and import standards (e.g., ONNX, SavedModel, TorchScript). |
| Accelerator compatibility | Ability to deploy on specialized inference hardware (e.g., TensorRT, Habana, Intel Gaudi). |
| Scaling method | Mechanism for parallel inference, replication, or sharding across compute nodes. |
| Resource management | Integration with schedulers and container runtimes such as Slurm, Kubernetes, or Singularity. |

### For Scientific Surrogate Modeling or Emulation

| Attribute | Description |
|------------|--------------|
| Physics-informed capability | Ability to incorporate physical constraints or governing equations (e.g., PINNs). |
| Uncertainty quantification | Support for probabilistic modeling or Bayesian inference. |
| Integration with simulation data | Native support for HDF5, ADIOS2, or custom data formats common in HPC. |
| Surrogate training scalability | Ability to scale to large training datasets from simulation output. |
| Coupling with simulation codes | APIs for embedding inference directly within simulation workflows. |

### For Hyperparameter Optimization and Workflow Automation

| Attribute | Description |
|------------|--------------|
| Search strategies | Types of hyperparameter search supported (e.g., random, Bayesian, evolutionary). |
| Scheduler awareness | Integration with HPC schedulers for parallel job launches. |
| Experiment tracking | Built-in tools for tracking experiments, configurations, and results. |
| Automation framework | Compatibility with tools like DeepHyper, Ray Tune, or MLFlow. |
| Reproducibility | Mechanisms to ensure deterministic experiments and versioned configurations. |

### For Edge or Hybrid HPC-AI Environments

| Attribute | Description |
|------------|--------------|
| Resource heterogeneity | Support for distributed execution across mixed CPU-GPU or edge-cloud systems. |
| Model compression | Ability to quantize or prune models for lightweight deployment. |
| Data streaming | Support for continuous data ingestion and inference pipelines. |
| Connectivity requirements | Handling of intermittent network connections or federated learning setups. |
| Security and privacy | Support for encrypted models, federated updates, or privacy-preserving training. |

---
layout: single
title: "E4S Data & Visualization Libraries and Tools Guide"
permalink: /guide-dav/
classes: wide
sidebar:
  nav: "botmenu"
---

<p style="text-align:center;">
    Construct your prompt from the instructions below then use the E4S Guide Bot
</p>
{% include e4s-bot-button.html %}

# Introduction

Selecting the right data and visualization libraries or tools is an important step in building efficient, scalable, and maintainable workflows for scientific computing and high-performance data analysis. The E4S 25.06 release includes a rich collection of data management, I/O, and visualization libraries designed for parallel performance, portability, and ecosystem integration. 

A newcomer should think about attributes related to their data structures, access patterns, parallelism model, visualization scale, supported hardware, and compatibility with programming environments. Understanding these attributes helps identify tools that meet the technical and scientific needs of a given project—whether the goal is to efficiently store and move simulation output, visualize multi-terabyte datasets, or integrate AI-assisted analytics into scientific workflows.

When defining selection attributes, it helps to consider both **broadly meaningful** characteristics (like portability or API support) and **situation-specific** attributes (like in-situ visualization, streaming data, or exascale readiness). 

These attributes can then be described in a structured form that allows a chatbot or decision assistant to guide the selection of appropriate E4S products such as ADIOS2, HDF5, ParaView, Ascent, VisIt, VTK-m, or Catalyst2.

# Example Prompt

> I need a parallel data I/O library that can handle structured mesh output from a multi-GPU simulation on Frontier. The workflow runs in MPI with C++ and uses Kokkos for parallelism. The output should be compatible with ParaView Catalyst for in-situ visualization. I prefer an open-source library with strong E4S support and minimal code changes for integration.

---

# Attributes for Data Libraries and Tools

## Broadly Meaningful Attributes

| Attribute | Description |
|------------|-------------|
| Parallel I/O support | Whether the library supports scalable I/O for distributed applications using MPI or similar models |
| Data model | Type of data supported (structured, unstructured, tabular, hierarchical, key-value, etc.) |
| Supported APIs | Available language bindings such as C, C++, Fortran, Python |
| Portability | Extent to which the library is portable across CPU and GPU systems and HPC platforms |
| Metadata management | Ability to manage and query metadata efficiently at scale |
| Compression | Support for data compression and decompression, including lossy or lossless modes |
| Checkpoint/restart capabilities | Whether the library supports state checkpointing and restart for resilience |
| File format compatibility | Interoperability with common file formats like HDF5, NetCDF, or BP5 |
| Data streaming | Ability to handle real-time or asynchronous data streams |
| E4S integration | Availability as part of E4S releases with verified Spack package support |
| License | Software license type and compatibility with project policies |
| Community support | Availability of documentation, tutorials, and active maintenance |
| Performance tuning | Options for optimizing data layout, buffering, and I/O scheduling |

## Situation-Specific Attributes for Data Libraries and Tools

### For Simulation Output

| Attribute | Description |
|------------|-------------|
| In-situ I/O | Direct output to visualization or analysis frameworks during simulation runtime |
| Temporal data management | Support for time series and multi-timestep data |
| Large-file scalability | Ability to handle multi-terabyte output efficiently |
| Domain decomposition mapping | Handling of partitioned data in structured or unstructured domains |

### For Machine Learning Data Pipelines

| Attribute | Description |
|------------|-------------|
| Tensor data support | Ability to read/write multi-dimensional tensor data efficiently |
| Streaming ingestion | Support for high-frequency or batched input data |
| Integration with AI frameworks | Compatibility with TensorFlow, PyTorch, or ONNX data formats |

### For Exascale and Heterogeneous Systems

| Attribute | Description |
|------------|-------------|
| GPU-direct I/O | Capability to move data between GPU memory and storage without CPU involvement |
| Burst buffer support | Awareness of fast intermediate storage tiers on supercomputers |
| Resilience features | Fault-tolerant I/O and restart mechanisms at extreme scale |

---

# Attributes for Visualization Libraries and Tools

## Broadly Meaningful Attributes

| Attribute | Description |
|------------|-------------|
| Rendering model | Type of rendering (rasterization, ray tracing, volume rendering) supported |
| Parallel rendering | Ability to distribute rendering across multiple nodes or GPUs |
| Supported data formats | Input formats supported (e.g., VTK, HDF5, ADIOS2, Exodus) |
| Integration with simulation frameworks | Ability to couple visualization with simulation codes for in-situ workflows |
| Language bindings | Availability of Python, C++, or scripting interfaces |
| Interactivity | Support for interactive exploration versus batch rendering |
| Scalability | Suitability for large data visualization on clusters or supercomputers |
| Extensibility | Ease of adding custom filters, readers, or visualization modules |
| E4S integration | Inclusion in E4S releases and maintained Spack recipes |
| Portability | Availability across Linux, macOS, Windows, and major HPC systems |
| Automation | Support for scripting and reproducible visualization workflows |

## Situation-Specific Attributes for Visualization Libraries and Tools

### For In-Situ Visualization

| Attribute | Description |
|------------|-------------|
| Catalyst or Ascent compatibility | Support for in-situ data coupling through Catalyst2 or Ascent |
| Data coupling mechanism | Method used to connect simulation data streams to visualization components |
| Memory sharing | Ability to operate without full data copies |
| Runtime overhead | Impact on simulation performance during coupled visualization |

### For Post-Processing and Analysis

| Attribute | Description |
|------------|-------------|
| File import range | Ability to load data from multiple simulation tools or formats |
| Parallel batch rendering | Capability to render large datasets without interactivity |
| Derived field generation | Tools for computing secondary quantities from raw data |
| Scripting interface | Availability of programmable interfaces for automation (e.g., Python scripting in ParaView) |

### For Interactive or Immersive Visualization

| Attribute | Description |
|------------|-------------|
| Interactive mode | Support for real-time user manipulation and exploration |
| Remote visualization | Ability to interact with large data sets remotely via client-server models |
| VR/AR readiness | Compatibility with immersive visualization systems |
| Web interface | Support for web-based exploration using WebGL or similar technologies |

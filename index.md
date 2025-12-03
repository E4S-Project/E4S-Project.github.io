---
layout: home
title: "E4S: HPC-AI Software Ecosystem for Science"
excerpt: "Performance-portable libraries & tools for advanced computing"
layout: splash # Default: home, but that includes a list of posts
classes: wide
header:
#   overlay_color: "#000"
#  overlay_filter: "0.60"
  overlay_filter: rgba(0, 146, 202, 0.75) # Same color as "air" skin footer
  overlay_image: /assets/images/e4s-logo.jpg
  actions:
    - label: "News & Events"
      url: "/news/"
      class: "btn--oval-blue"
    - label: "Get E4S"
      url: "/get/"
      class: "btn--oval-blue"
    - label: "Quick Start"
      url: "/quick-start/"
      class: "btn--oval-blue"
permalink: "/"
---

Welcome to **E4S**, the *HPC-AI Software Ecosystem for Science* — an open-source, community-driven collection of high-quality HPC and AI libraries and tools. E4S is an **Extreme-scale Scientific Software Stack** that enables scientists, developers, and institutions to develop, deploy, and run performance-portable applications across CPUs and GPUs from NVIDIA, AMD, Intel, and Arm. Ready to adapt to new architectures as they emerge.

Supported by the **U.S. Department of Energy (DOE)** and its partners, E4S accelerates scientific innovation on systems ranging from laptops to exascale supercomputers.

{% include e4s-card-style.html %}

{% capture icon_perf %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M9 9h6v6H9z"/></svg>
{% endcapture %}

{% capture icon_ecosystem %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="6" rx="1"/><rect x="3" y="9" width="18" height="6" rx="1"/><rect x="3" y="15" width="18" height="6" rx="1"/></svg>
{% endcapture %}

{% capture icon_repro %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 5V3m0 18v-2m9-7h2M3 12H1m16.95 5.95l1.414 1.414M5.636 5.636 4.222 4.222M18.364 5.636l1.414-1.414M5.636 18.364 4.222 19.778"/><circle cx="12" cy="12" r="5"/></svg>
{% endcapture %}

{% capture icon_validation %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 7h16M4 12h8M4 17h4M15 16l2 2 3-3"/></svg>
{% endcapture %}

{% include e4s-four-card-content.html

   card1_icon=icon_perf
   card1_title="Performance Portability"
   card1_front_text="Run anywhere—from laptops to exascale supercomputers using modern GPU and CPU architectures."
   card1_back_text="E4S supports programming models like Kokkos and MPI to enable single-source performance across CPUS and GPUs, and scalable clusters to leadership systems."

   card2_icon=icon_ecosystem
   card2_title="Curated Ecosystem"
   card2_front_text="Over 140 interoperable libraries and tools for HPC and AI workflows, validated for research and production use."
   card2_back_text="E4S organizes products into product families such as math libraries, I/O, AI/ML, and performance tools—curated for compatibility and tested integration."

   card3_icon=icon_repro
   card3_title="Reproducible Environments"
   card3_front_text="Deploy via Spack, pre-built containers for Docker, Singularity, and commercial cloud environments."
   card3_back_text="Binary caches, container images, and continuous builds ensure consistent environments across facilities, enabling reproducible experiments and fair benchmarking."

   card4_icon=icon_validation
   card4_title="Continuous Validation"
   card4_front_text="E4S packages are tested across DOE leadership and cloud platforms for quality and reproducibility."
   card4_back_text="Automated pipelines validate builds nightly across dozens of devices on the Frank testbed, tracking API/ABI changes and ensuring cross-platform reproducibility."
%}

{% capture icon_chat %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 4h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H7l-4 4v-4H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2z"/></svg>
{% endcapture %}

{% capture bot_front %}
Ask questions, explore tools, or get recommendations from the E4S Guide Bot.
<div style="margin-top: 1rem;">
  {% include e4s-bot-button.html %}
</div>
{% endcapture %}

{% capture bot_back %}
The E4S Guide Bot is a domain-specialized Retrieval-Augmented Generation (RAG) assistant powered by a custom GPT and a curated corpus of E4S ecosystem documentation.
<div style="margin-top: 1rem;">
  {% include e4s-bot-button.html %}
</div>
{% endcapture %}

{% capture icon_catalog %}
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 4h14a2 2 0 0 1 2 2v14l-4-2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2z"/></svg>
{% endcapture %}

{% capture catalog_front %}
Browse member products, product families, with extensive links, via the E4S Product Catalog.
<div style="margin-top: 1rem;">
  {% include e4s-product-catalog-button.html %}
</div>
{% endcapture %}

{% capture catalog_back %}
The E4S Product catalog is a searchable, sortable table of all primary E4S products with summaries and links to full documentation.
<div style="margin-top: 1rem;">
  {% include e4s-product-catalog-button.html %}
</div>
{% endcapture %}


{% include e4s-two-card-content.html

   card1_icon=icon_chat
   card1_title="Chat with the E4S Bot"
   card1_front_text=bot_front
   card1_back_text=bot_back

   card2_icon=icon_catalog
   card2_title="Visit the E4S Product Catalog"
   card2_front_text=catalog_front
   card2_back_text=catalog_back

%}

{% include e4s-card-script.html %}

---
<p style="text-align:center;">
    <strong style="font-size: 1.5em;">Trusted by the HPC-AI Community</strong>
</p>
E4S is developed and supported by contributors from U.S. national laboratories, universities, and industry partners. It is available as both open-source and commercial distributions such as [ParaTools Pro for E4S™](https://paratoolspro.com) for commercial cloud platforms such as AWS, Azure, GCP, OCI, and IBM Cloud.

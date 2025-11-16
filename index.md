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
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M9 9h6v6H9z"/></svg>
      <h3>Performance Portability</h3>
      <p>Run anywhere—from laptops to exascale supercomputers using modern GPU and CPU architectures.</p>
      <p style="text-align: center; font-size: 0.7em;">Flip for details</p>
    </div>
    <div class="card-back">
    <h3>More Details</h3>
      <p>E4S supports programming models like Kokkos and MPI to enable single-source performance across CPUS and GPUs, and scalable clusters to leadership systems.</p>
    </div>
  </div>
</div>

<!-- 2 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="6" rx="1"/><rect x="3" y="9" width="18" height="6" rx="1"/><rect x="3" y="15" width="18" height="6" rx="1"/></svg>
      <h3>Curated Ecosystem</h3>
      <p>Over 120 interoperable libraries and tools for HPC and AI workflows, validated for research and production use.</p>
      <p style="text-align: center; font-size: 0.7em;">Flip for details</p>
    </div>
    <div class="card-back">
    <h3>More Details</h3>
      <p>E4S organizes products into product families such as math libraries, I/O, AI/ML, and performance tools—curated for compatibility and tested integration.</p>
    </div>
  </div>
</div>

<!-- 3 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 5V3m0 18v-2m9-7h2M3 12H1m16.95 5.95l1.414 1.414M5.636 5.636 4.222 4.222M18.364 5.636l1.414-1.414M5.636 18.364 4.222 19.778"/><circle cx="12" cy="12" r="5"/></svg>
      <h3>Reproducible Environments</h3>
      <p>Deploy via Spack, pre-built containers for Docker, Singularity, and commercial cloud environments.</p>
      <p style="text-align: center; font-size: 0.7em;">Flip for details</p>
    </div>
    <div class="card-back">
    <h3>More Details</h3>
      <p>Binary caches, container images, and continuous builds ensure consistent environments across facilities, enabling reproducible experiments and fair benchmarking.</p>
    </div>
  </div>
</div>

<!-- 4 -->
<div class="feature-item">
  <div class="card-inner">
    <div class="card-front">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 7h16M4 12h8M4 17h4M15 16l2 2 3-3"/></svg>
      <h3>Continuous Validation</h3>
      <p>E4S packages are tested across DOE leadership and cloud platforms for quality and reproducibility.</p>
      <p style="text-align: center; font-size: 0.7em;">Flip for details</p>
    </div>
    <div class="card-back">
      <h3>More Details</h3>
      <p>Automated pipelines validate builds nightly across dozens of devices on the Frank testbed, tracking API/ABI changes and ensuring cross-platform reproducibility.</p>
    </div>
  </div>
</div>

</div>

<!-- SECOND FEATURE ROW: Bot and Buttons -->
<div class="feature-grid feature-row-botcatalog">

  <!-- Left: E4S Bot -->
  <div class="feature-item static-card">
    <div class="card-front">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 4h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H7l-4 4v-4H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2z"/></svg>
      <h3>Chat with the E4S Bot</h3>
      <p>Ask questions, explore tools, or get recommendations from the E4S Guide Bot.</p>
      <div style="margin-top: 1rem;">
        {% include e4s-bot-button.html %}
      </div>
    </div>
  </div>

  <!-- Right: E4S Doc catalog -->
  <div class="feature-item static-card">
    <div class="card-front">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4 4h14a2 2 0 0 1 2 2v14l-4-2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2z"/></svg>
      <h3>Visit the E4S Product Catalog</h3>
      <p>Browse member products, product families, with extensive links, via the E4S Product Catalog</p>
      <div style="margin-top: 1rem;">
        {% include e4s-product-catalog-button.html %}
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
<p style="text-align:center;">
    <strong style="font-size: 1.5em;">Trusted by the HPC-AI Community</strong>
</p>
E4S is developed and supported by contributors from U.S. national laboratories, universities, and industry partners. It is available as both open-source and commercial distributions such as [ParaTools Pro for E4S™](https://paratoolspro.com) for commercial cloud platforms such as AWS, Azure, GCP, OCI, and IBM Cloud.

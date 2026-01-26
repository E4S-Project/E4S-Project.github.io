---
title: "E4S Product Catalog"
redirect_from:
  - /DocPortal.html
layout: single
classes: wide
permalink: /product-catalog/
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

The E4S Product Catalog provides a convenient searchable and sortable table that provides per-product information for all primary E4S products.


<div id="product-catalog-app" class="mm-product-catalog">
  <div class="controls">
    <label>
      🔎 Search
      <input id="searchInput" type="search" placeholder="Filter by name, area, or description…" />
    </label>
    <label>
      📂 Area
      <select id="areaFilter">
        <option value="">All areas</option>
      </select>
    </label>
  </div>

  <div class="table-wrap">
    <table id="docTable">
      <thead>
        <tr>
          <th data-key="name" class="sortable">Name</th>
          <th data-key="area" class="sortable">Area</th>
          <th data-key="description" class="sortable">Description</th>
          <th data-key="last_updated" class="sortable" data-type="date">Last Updated</th>
          <th>Details</th>
        </tr>
      </thead>
      <tbody><!-- rows injected by JS --></tbody>
    </table>
  </div>

  <!-- Modal -->
  <dialog id="detailsModal">
    <article>
      <header>
        <h3 id="modalTitle">Details</h3>
        <button id="closeModal" aria-label="Close">✖</button>
      </header>
      <div id="modalBody" class="modal-body"></div>
    </article>
  </dialog>
</div>

<style>
.mm-product-catalog .controls {
  display: grid; gap: .75rem; grid-template-columns: 1fr 220px; margin-bottom: 1rem;
}
.mm-product-catalog .controls label { display:flex; gap:.5rem; align-items:center; }
.mm-product-catalog #searchInput, .mm-product-catalog #areaFilter {
  width: 100%; padding: .5rem .6rem; border: 1px solid var(--mm-border,#e6e6e6); border-radius: .35rem;
}
.mm-product-catalog .table-wrap { overflow-x:auto; }
#docTable { width:100%; border-collapse: collapse; }
#docTable th, #docTable td { padding: .6rem .5rem; border-bottom: 1px solid var(--mm-border,#eee); vertical-align: top; }
#docTable th.sortable { cursor: pointer; user-select: none; }
#docTable th.sortable::after { content: " ↕"; opacity: .35; }
#docTable th.sort-asc::after { content: " ↑"; opacity: .8; }
#docTable th.sort-desc::after { content: " ↓"; opacity: .8; }
#docTable td .name { font-weight:600; }
#docTable td .desc { color: var(--mm-muted,#666); }
#docTable td .meta { font-size:.85em; color: var(--mm-muted,#666); }

dialog#detailsModal { max-width: 960px; width: 96%; border: none; border-radius: .5rem; padding: 0; }
dialog#detailsModal::backdrop { background: rgba(0,0,0,.35); }
dialog#detailsModal article { padding: 0; }
dialog#detailsModal header { padding: .85rem 1rem; border-bottom: 1px solid #eee; display:flex; align-items:center; justify-content: space-between; }
dialog#detailsModal .modal-body { padding: 1rem; max-height: 70vh; overflow:auto; }
dialog#detailsModal #closeModal { background: transparent; border: none; font-size: 1.1rem; cursor: pointer; }
.mm-product-catalog .badge { display:inline-block; padding:.2rem .45rem; border-radius: .35rem; background:#f3f4f6; font-size:.75rem; margin-right:.25rem; }
</style>

<script>
// 1) Pull data from Jekyll _data
const RAW_DATA = {% assign items = site.data.product-catalog.data | default: site.data.product-catalog | default: empty %}
{% if items and items.first and items.first.name %}
{{ items | jsonify }}
{% else %}
[]  // fallback if front-matter build preview lacks data
{% endif %};

// 2) Normalize/prepare rows
function parseDate(s){ if(!s) return null; const d = new Date(s.replace(' ', 'T')+'Z'); return isNaN(d) ? null : d; }
const DATA = RAW_DATA.map(x => ({
  name: x.name || '',
  area: x.area || '',
  description: x.description || '',
  last_updated_raw: x.last_updated || '',
  last_updated: parseDate(x.last_updated),
  html_blob: x.html_blob || ''
}));

// 3) Populate Area filter
(function initAreaFilter(){
  const areas = [...new Set(DATA.map(d => d.area).filter(Boolean))].sort();
  const sel = document.getElementById('areaFilter');
  areas.forEach(a => {
    const opt = document.createElement('option');
    opt.value = a; opt.textContent = a;
    sel.appendChild(opt);
  });
})();

// 4) Rendering + Filtering + Sorting
const tbody = document.querySelector('#docTable tbody');
const searchInput = document.getElementById('searchInput');
const areaFilter = document.getElementById('areaFilter');
let sortKey = 'name';
let sortDir = 'asc';

function textMatch(hay, needle){
  return hay.toLowerCase().includes(needle.trim().toLowerCase());
}

function currentRows(){
  const q = (searchInput.value || '').trim().toLowerCase();
  const area = areaFilter.value;
  return DATA.filter(r => {
    const inArea = !area || r.area === area;
    const matches = !q || textMatch(r.name, q) || textMatch(r.area, q) || textMatch(r.description, q);
    return inArea && matches;
  }).sort((a,b) => {
    const A = a[sortKey], B = b[sortKey];
    let res = 0;
    if (sortKey === 'last_updated') {
      const aT = a.last_updated ? a.last_updated.getTime() : 0;
      const bT = b.last_updated ? b.last_updated.getTime() : 0;
      res = aT - bT;
    } else {
      res = String(A).localeCompare(String(B), undefined, {sensitivity:'base'});
    }
    return sortDir === 'asc' ? res : -res;
  });
}

function formatDate(d){
  if(!d) return '';
  // Render as YYYY-MM-DD for clean sorting and scanning
  const y = d.getUTCFullYear();
  const m = String(d.getUTCMonth()+1).padStart(2,'0');
  const day = String(d.getUTCDate()).padStart(2,'0');
  return `${y}-${m}-${day}`;
}

function render(){
  tbody.innerHTML = '';
  const rows = currentRows();
  rows.forEach(r => {
    const tr = document.createElement('tr');

    const tdName = document.createElement('td');
    tdName.innerHTML = `<div class="name">${r.name}</div><div class="meta">${r.area ? `<span class="badge">${r.area}</span>` : ''}</div>`;

    const tdArea = document.createElement('td');
    tdArea.textContent = r.area;

    const tdDesc = document.createElement('td');
    tdDesc.innerHTML = `<div class="desc">${r.description || ''}</div>`;

    const tdUpdated = document.createElement('td');
    tdUpdated.textContent = r.last_updated ? formatDate(r.last_updated) : (r.last_updated_raw || '');

    const tdDetails = document.createElement('td');
    const btn = document.createElement('button');
    btn.type = 'button';
    btn.textContent = 'Open';
    btn.addEventListener('click', () => openDetails(r));
    tdDetails.appendChild(btn);

    tr.appendChild(tdName);
    tr.appendChild(tdArea);
    tr.appendChild(tdDesc);
    tr.appendChild(tdUpdated);
    tr.appendChild(tdDetails);
    tbody.appendChild(tr);
  });
  updateSortIndicators();
}

function updateSortIndicators(){
  document.querySelectorAll('#docTable th.sortable').forEach(th => {
    th.classList.remove('sort-asc','sort-desc');
    if (th.dataset.key === sortKey){
      th.classList.add(sortDir === 'asc' ? 'sort-asc' : 'sort-desc');
    }
  });
}

// 5) Sorting handlers
document.querySelectorAll('#docTable th.sortable').forEach(th => {
  th.addEventListener('click', () => {
    const key = th.dataset.key;
    if (sortKey === key){
      sortDir = (sortDir === 'asc' ? 'desc' : 'asc');
    } else {
      sortKey = key;
      sortDir = 'asc';
    }
    // Optional: reflect sorting in URL too (kept minimal: not encoded by default)
    render();
  });
});

// 6) URL state (read on load; write as user changes)

// Read URL params and apply to UI controls.
// Supports: ?search=... (legacy), ?q=... (alias), ?area=..., ?product=...
function applyUrlState(){
  const params = new URLSearchParams(window.location.search);

  const q = (params.get('search') || params.get('q') || '').trim();
  if (q) searchInput.value = q;

  const a = (params.get('area') || '').trim();
  if (a) areaFilter.value = a;
}

// Keep URL in sync with current UI state (bookmarkable deep links).
function syncUrl(){
  const params = new URLSearchParams(window.location.search);

  const q = (searchInput.value || '').trim();
  if (q) params.set('search', q);
  else { params.delete('search'); params.delete('q'); }

  const a = (areaFilter.value || '').trim();
  if (a) params.set('area', a);
  else params.delete('area');

  const query = params.toString();
  const newUrl = query ? `${window.location.pathname}?${query}` : window.location.pathname;
  window.history.replaceState({}, '', newUrl);
}

// 7) Details modal (decode base64 html_blob and inject)
const modal = document.getElementById('detailsModal');
const modalTitle = document.getElementById('modalTitle');
const modalBody = document.getElementById('modalBody');
const closeModal = document.getElementById('closeModal');
closeModal.addEventListener('click', () => modal.close());
modal.addEventListener('click', (e) => { if(e.target === modal) modal.close(); });

function openDetails(row){
  modalTitle.textContent = row.name || 'Details';
  modalBody.innerHTML = '';

  if (row.html_blob){
    try {
      // Some YAML dumps can include newlines/spaces; atob expects clean base64
      const b64 = String(row.html_blob).replace(/\s+/g,'').trim();
      const decoded = atob(b64);
      // Trust the provided HTML snippet from your data source
      modalBody.innerHTML = decoded;
    } catch (e){
      modalBody.innerHTML = `<p><em>Could not decode details payload.</em></p>`;
    }
  } else {
    modalBody.innerHTML = `<p><em>No additional details available.</em></p>`;
  }
  if (typeof modal.showModal === 'function') {
    modal.showModal();
  } else {
    // Fallback for older browsers
    modal.setAttribute('open', 'open');
  }
}

// Optional: open product details directly from URL (?product=...)
function openProductFromUrl(){
  const params = new URLSearchParams(window.location.search);
  const p = (params.get('product') || '').trim();
  if (!p) return;

  const needle = p.toLowerCase();
  const row =
    DATA.find(d => (d.name || '').toLowerCase() === needle) ||
    DATA.find(d => (d.name || '').toLowerCase().includes(needle));

  if (row) openDetails(row);
}

// 8) Search/filter handlers (now sync URL too)
searchInput.addEventListener('input', () => { syncUrl(); render(); });
areaFilter.addEventListener('change', () => { syncUrl(); render(); });

// Initial paint
applyUrlState();
render();
openProductFromUrl();
</script>

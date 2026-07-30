const API_BASE = 'https://webappresepmakanan-production.up.railway.app';

async function apiFetch(path, options = {}) {
  const res = await fetch(`${API_BASE}${path}`, {
    headers: { 'Content-Type': 'application/json' },
    ...options,
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: 'Request failed' }));
    throw new Error(err.error || `HTTP ${res.status}`);
  }
  return res.json();
}

document.addEventListener('DOMContentLoaded', () => {
  const ingredientList = document.getElementById('ingredient-list');
  const searchBtn = document.getElementById('search-btn');
  const resultList = document.getElementById('result-list');
  const resultInfo = document.getElementById('result-info');

  if (ingredientList) loadIngredients();

  if (searchBtn) {
    searchBtn.addEventListener('click', searchRecipes);
  }

  const urlParams = new URLSearchParams(window.location.search);
  const detailId = urlParams.get('id');
  if (detailId) loadDetail(detailId);
});

async function loadIngredients() {
  const list = document.getElementById('ingredient-list');
  try {
    const bahan = await apiFetch('/api/bahan');
    list.innerHTML = '';
    bahan.forEach((b) => {
      const label = document.createElement('label');
      label.className = 'ingredient-item';
      label.innerHTML = `<input type="checkbox" value="${b.id}"> ${b.nama_bahan}`;
      label.addEventListener('click', (e) => {
        if (e.target.tagName !== 'INPUT') {
          const cb = label.querySelector('input');
          cb.checked = !cb.checked;
        }
        label.classList.toggle('selected', label.querySelector('input').checked);
      });
      list.appendChild(label);
    });
  } catch (err) {
    list.innerHTML = `<p class="error-message">Gagal memuat bahan: ${err.message}</p>`;
  }
}

async function searchRecipes() {
  const checkboxes = document.querySelectorAll('#ingredient-list input[type="checkbox"]:checked');
  const bahanIds = Array.from(checkboxes).map((cb) => parseInt(cb.value));
  const resultList = document.getElementById('result-list');
  const resultInfo = document.getElementById('result-info');

  if (bahanIds.length === 0) {
    resultList.innerHTML = '<p class="placeholder-text">Pilih minimal 1 bahan terlebih dahulu.</p>';
    resultInfo.textContent = '';
    return;
  }

  resultList.innerHTML = '<p class="loading">Mencari resep...</p>';
  resultInfo.textContent = '';

  try {
    const resepList = await apiFetch('/api/resep/filter', {
      method: 'POST',
      body: JSON.stringify({ bahan_ids: bahanIds }),
    });

    if (resepList.length === 0) {
      resultList.innerHTML = '<p class="error-message">Belum ada resep yang cocok dengan bahan ini, coba pilih bahan lain.</p>';
      resultInfo.textContent = '';
      return;
    }

    resultInfo.textContent = `Menampilkan ${resepList.length} resep yang cocok dengan bahan kamu.`;
    resultList.innerHTML = resepList.map((r) => `
      <a href="detail.html?id=${r.id}" class="recipe-card">
        <img src="${r.image_url || 'https://placehold.co/400x300/eee/999?text=Resep'}" alt="${r.nama}" loading="lazy">
        <div class="recipe-card-body">
          <h3>${r.nama}</h3>
          <span class="badge">${r.kategori || 'Umum'}</span>
          <p class="match-info">Sesuai ${r.jumlah_cocok}/${r.total_bahan} bahan</p>
        </div>
      </a>
    `).join('');
  } catch (err) {
    resultList.innerHTML = `<p class="error-message">Gagal mencari resep: ${err.message}</p>`;
  }
}

async function loadDetail(id) {
  const loading = document.getElementById('detail-loading');
  const error = document.getElementById('detail-error');
  const content = document.getElementById('detail-content');

  try {
    const resep = await apiFetch(`/api/resep/${id}`);

    document.getElementById('detail-nama').textContent = resep.nama;
    document.getElementById('detail-kategori').textContent = resep.kategori || 'Umum';
    document.getElementById('detail-waktu').textContent = resep.waktu_masak ? `⏱ ${resep.waktu_masak} menit` : '';
    document.getElementById('detail-deskripsi').textContent = resep.deskripsi || '';

    const img = document.getElementById('detail-image');
    img.src = resep.image_url || 'https://placehold.co/400x300/eee/999?text=Resep';
    img.alt = resep.nama;

    const bahanList = document.getElementById('bahan-list');
    bahanList.innerHTML = resep.bahan.map((b) =>
      `<li>${b.nama_bahan}${b.jumlah ? ` — ${b.jumlah} ${b.satuan || ''}` : ''}</li>`
    ).join('');

    const langkahList = document.getElementById('langkah-list');
    const langkahArr = resep.langkah.split('\n').filter((l) => l.trim());
    langkahList.innerHTML = langkahArr.map((l) => `<li>${l.replace(/^\d+[\.\)]\s*/, '')}</li>`).join('');

    const videoDiv = document.getElementById('detail-video');
    const videoLink = document.getElementById('video-link');
    if (resep.video_url) {
      videoLink.href = resep.video_url;
      videoDiv.style.display = 'block';
    }

    loading.style.display = 'none';
    content.style.display = 'block';
    document.title = `${resep.nama} - Resep Makan dari Bahan Seadanya`;
  } catch (err) {
    loading.style.display = 'none';
    error.style.display = 'block';
    error.textContent = `Gagal memuat resep: ${err.message}`;
  }
}

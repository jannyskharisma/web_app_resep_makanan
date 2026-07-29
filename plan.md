# Prompt untuk AI Coding Assistant

Bangun sebuah web app resep makanan bernama **"Resep Makan dari Bahan Seadanya"** sesuai spesifikasi lengkap di bawah ini. Ikuti struktur folder, skema database, dan daftar endpoint API persis seperti yang dijabarkan. Kerjakan bertahap sesuai urutan roadmap di bagian akhir dokumen ini, dan tanyakan konfirmasi sebelum pindah ke tahap berikutnya kalau ada bagian yang ambigu.

---

## 1. Ringkasan Proyek

Aplikasi web yang membantu pengguna menemukan resep masakan berdasarkan bahan yang mereka miliki di rumah. Pengguna memilih/menandai bahan yang tersedia di halaman awal, sistem menampilkan daftar resep yang paling sesuai, dan pengguna bisa membuka detail resep (bahan lengkap + takaran + langkah memasak bernomor, mirip Cookpad) lengkap dengan opsi link video tutorial.

**Target pengguna**: masyarakat umum, khususnya anak kos atau siapa saja yang bingung mau masak apa dengan bahan seadanya, untuk mengurangi kebingungan dan pemborosan bahan makanan.

## 2. Tujuan & Fitur Utama

- Pengguna bisa memilih bahan yang tersedia (checkbox atau pencarian bahan).
- Sistem memfilter dan menampilkan resep yang paling cocok dengan bahan yang dipilih.
- Halaman detail resep menampilkan: nama, kategori, deskripsi singkat, daftar bahan dengan takaran, langkah memasak bernomor, estimasi waktu masak, foto, dan link video (opsional).
- (Opsional pengembangan lanjut, kerjakan setelah MVP selesai): simpan resep favorit, rating resep, kontribusi resep dari pengguna lain.

## 3. Tumpukan Teknologi (Tech Stack)

| Bagian | Teknologi | Hosting |
|---|---|---|
| Frontend | HTML, CSS, JavaScript (vanilla, tanpa framework kecuali disepakati lain) | GitHub Pages (statis, gratis) |
| Backend | Node.js + Express | Railway |
| Database | PostgreSQL | Railway |
| Komunikasi frontend-backend | REST API via `fetch()`, JSON | - |

**Alasan pemisahan frontend/backend**: GitHub Pages hanya bisa serve file statis (tidak bisa menjalankan server), sehingga backend wajib dihosting terpisah. Railway dipilih karena bisa menghosting backend dan database sekaligus dalam satu project secara gratis.

## 4. Arsitektur Sistem

```
Pengguna (browser)
      |
      v
[Frontend - GitHub Pages]
   HTML/CSS/JS statis
      |
      | fetch() / HTTP (perlu CORS)
      v
[Backend - Railway]
   Node.js + Express API
      |
      | SQL query (internal network Railway)
      v
[Database - Railway]
   PostgreSQL
```

Backend bertindak sebagai satu-satunya pihak yang menyimpan credential database (lewat environment variable `DATABASE_URL`, tidak boleh di-hardcode). Frontend tidak pernah connect langsung ke database.

## 5. Skema Database

Menggunakan relasi many-to-many antara resep dan bahan lewat tabel penghubung, supaya query filter "resep dari bahan yang saya punya" efisien.

```sql
CREATE TABLE resep (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(150) NOT NULL,
  kategori VARCHAR(50),
  deskripsi TEXT,
  langkah TEXT NOT NULL,          -- langkah memasak, bisa disimpan sebagai teks bernomor atau JSON array
  waktu_masak INT,                -- dalam menit
  video_url VARCHAR(255),         -- opsional, link YouTube/tutorial
  image_url VARCHAR(255),         -- opsional, link/path foto resep
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE bahan (
  id SERIAL PRIMARY KEY,
  nama_bahan VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE resep_bahan (
  resep_id INT NOT NULL REFERENCES resep(id) ON DELETE CASCADE,
  bahan_id INT NOT NULL REFERENCES bahan(id) ON DELETE CASCADE,
  jumlah NUMERIC(10,2),
  satuan VARCHAR(20),             -- contoh: gram, sdm, butir, siung
  PRIMARY KEY (resep_id, bahan_id)
);
```

**Catatan desain**:
- `jumlah` dan `satuan` ditaruh di tabel penghubung `resep_bahan`, bukan di `bahan`, karena takaran berbeda-beda tergantung resepnya.
- `nama_bahan` di tabel `bahan` dibuat `UNIQUE` supaya tidak ada duplikat (misal "telur" dan "Telur" harus dinormalisasi sebelum insert).
- `langkah` disimpan sebagai TEXT (boleh multi-baris dengan nomor manual, atau diubah ke JSON array of strings kalau ingin lebih terstruktur — putuskan salah satu dan konsisten).

## 6. Spesifikasi API Backend (Express)

Base URL contoh: `https://<nama-project>.up.railway.app`

| Method | Endpoint | Deskripsi | Body / Query |
|---|---|---|---|
| GET | `/api/bahan` | Ambil semua daftar bahan (untuk ditampilkan sebagai checkbox/opsi di halaman awal) | - |
| GET | `/api/resep` | Ambil semua resep (ringkas: id, nama, kategori, image_url) | Query opsional: `?kategori=` |
| GET | `/api/resep/:id` | Ambil detail 1 resep lengkap (bahan, takaran, langkah, video_url) | - |
| POST | `/api/resep/filter` | Ambil resep yang cocok dengan bahan yang dikirim, diurutkan dari yang paling banyak cocok | Body JSON: `{ "bahan_ids": [1, 2, 3] }` |
| POST | `/api/resep` | (Admin/seed) Tambah resep baru beserta bahan-bahannya | Body JSON sesuai skema resep + array bahan |

**Detail response `POST /api/resep/filter`**: kembalikan resep beserta jumlah bahan yang cocok dan total bahan yang dibutuhkan, supaya frontend bisa menampilkan misalnya "cocok 4 dari 5 bahan". Urutkan hasil dari persentase kecocokan tertinggi.

**CORS**: aktifkan middleware `cors` di Express, izinkan origin dari domain GitHub Pages kamu (`https://<username>.github.io`).

## 7. Struktur Folder Proyek

Disarankan memisahkan frontend dan backend dalam 2 folder terpisah di repo yang sama, supaya Railway bisa deploy hanya folder backend lewat setting "Root Directory":

```
resep-makan-capstone/
├── frontend/
│   ├── index.html          # halaman pilih bahan + hasil filter
│   ├── detail.html         # halaman detail resep
│   ├── style.css
│   └── script.js           # logic fetch ke backend API
├── backend/
│   ├── src/
│   │   ├── index.js        # entry point Express
│   │   ├── routes/
│   │   │   ├── bahan.js
│   │   │   └── resep.js
│   │   └── db.js           # koneksi PostgreSQL pakai process.env.DATABASE_URL
│   ├── migrations/
│   │   └── 001_init.sql    # isi dengan skema di bagian 5
│   ├── package.json
│   └── .env.example        # contoh: DATABASE_URL=
├── .github/
│   └── workflows/
│       └── deploy-pages.yml  # workflow GitHub Actions untuk deploy frontend
├── .gitignore               # wajib exclude .env, node_modules
└── README.md
```

## 8. Environment Variables

Backend butuh minimal:
- `DATABASE_URL` — connection string PostgreSQL dari Railway (jangan pernah di-hardcode atau ikut ter-commit ke Git; taruh contoh formatnya saja di `.env.example`).
- `PORT` — opsional, Railway biasanya inject otomatis.

## 9. Data Awal (Seed Data)

Sediakan minimal 15-20 resep awal yang ditulis manual (boleh terinspirasi dari berbagai sumber referensi, tapi ditulis ulang dengan kata-kata sendiri, bukan copy-paste). Prioritaskan resep dengan bahan-bahan umum dan sederhana (telur, nasi, mi instan, tahu, tempe, sayur umum) sesuai tema "bahan seadanya". Simpan sebagai file migration/seed SQL terpisah (`002_seed.sql`) supaya gampang di-reset atau ditambah nanti.

## 10. Kebutuhan Non-Fungsional

- Responsif (bisa dipakai di HP, karena target pengguna kemungkinan besar akses dari mobile).
- Tampilkan pesan yang jelas kalau hasil filter kosong ("Belum ada resep yang cocok dengan bahan ini, coba pilih bahan lain").
- Validasi input dasar di backend (misal `bahan_ids` harus array of integer, bukan string sembarangan).
- Jangan expose stack trace error ke response API di production.

## 11. Deploy Backend ke Railway (Langkah demi Langkah)

### 11.1. Setup Akun & Project

1. Login ke [railway.com](https://railway.com) (via GitHub).
2. Klik **New Project** → **Deploy from GitHub repo** → pilih repo ini.
3. Di dashboard project, klik **New** → **Database** → **Add PostgreSQL**.

### 11.2. Koneksi Database

1. Klik PostgreSQL yang baru dibuat, buka tab **Connect**.
2. Salin **Postgres Connection URL** (mulai `postgresql://...`).
3. Klik project root di sidebar → **Variables**.
4. Tambah variable: `DATABASE_URL` = URL yang disalin tadi.
5. Tambah variable: `NODE_ENV` = `production`.

### 11.3. Root Directory

1. Di project settings, set **Root Directory** ke `backend`.
2. Railway otomatis deteksi `package.json` dan jalankan `npm start`.

### 11.4. Deploy

1. Setelah root directory di-set, Railway akan otomatis deploy ulang.
2. Klik tab **Deployments**, tunggu status jadi **Deployed**.
3. Klik tab **Settings** → **Generate Domain** untuk mendapat URL (contoh: `https://resep-makan.up.railway.app`).

### 11.5. Migration Database

1. Di dashboard PostgreSQL, buka tab **Connect** → **Railway CLI**.
2. Jalankan perintah berikut dari terminal lokal (butuh [Railway CLI](https://docs.railway.com/develop/cli) terinstall):

   ```bash
   # login dan link ke project
   railway login
   railway link

   # migration & seed
   railway run "psql \$DATABASE_URL -f migrations/001_init.sql"
   railway run "psql \$DATABASE_URL -f migrations/002_seed.sql"
   ```

   **Alternatif tanpa CLI**: Copy `DATABASE_URL` dan jalankan psql manual:

   ```bash
   psql "postgresql://..." -f backend/migrations/001_init.sql
   psql "postgresql://..." -f backend/migrations/002_seed.sql
   ```

### 11.6. CORS

Backend sudah menggunakan `cors()` tanpa pembatasan origin — ini cukup untuk development.  
Untuk production, tambahkan domain GitHub Pages sebagai whitelist di `backend/src/index.js`:

```js
app.use(cors({ origin: 'https://<username>.github.io' }));
```

### 11.7. Update Frontend

1. Buka `frontend/script.js`, ganti `API` dengan URL backend Railway (langkah 11.4).
2. Commit & push ke GitHub → GitHub Actions otomatis deploy frontend ke Pages.

## 12. Roadmap Pengerjaan (kerjakan berurutan)

1. **Perancangan** — buat migration SQL sesuai skema di bagian 5, tulis 15-20 resep awal sebagai seed data.
2. **Backend** — implementasikan semua endpoint di bagian 6, sambungkan ke PostgreSQL via `DATABASE_URL`, test lokal dengan Postman/curl sebelum deploy.
3. **Frontend** — bangun `index.html` (pilih bahan via checkbox, tombol "Cari resep", tampilkan hasil sebagai kartu resep) dan `detail.html` (tampilkan detail lengkap 1 resep).
4. **Integrasi** — sambungkan frontend ke backend yang sudah di-deploy di Railway, pastikan CORS berjalan, tes end-to-end dari browser.
5. **Uji & penyempurnaan** — uji berbagai kombinasi bahan (termasuk kombinasi tanpa hasil), perbaiki tampilan, tulis README cara menjalankan project.

## 12. Kriteria Selesai (Definition of Done)

- [ ] Pengguna bisa memilih bahan dan mendapat daftar resep yang relevan.
- [ ] Halaman detail resep menampilkan bahan, takaran, dan langkah dengan jelas.
- [ ] Aplikasi bisa diakses publik lewat URL GitHub Pages dan backend-nya lewat Railway.
- [ ] Tidak ada credential (database URL, API key) yang ter-commit ke repository.
- [ ] README menjelaskan cara setup ulang project dari nol (install dependency, isi `.env`, jalankan migration).

# Resep Makan dari Bahan Seadanya

Web app untuk menemukan resep masakan berdasarkan bahan yang tersedia di rumah. Dibuat sebagai proyek Capstone Design.

## Tech Stack

| Bagian | Teknologi | Hosting |
|--------|-----------|---------|
| Frontend | HTML, CSS, JavaScript (vanilla) | GitHub Pages |
| Backend | Node.js + Express | Railway |
| Database | PostgreSQL | Railway |

## Struktur Folder

```
resep-makan-capstone/
├── frontend/              # HTML/CSS/JS statis
│   ├── index.html         # Halaman pilih bahan + hasil filter
│   ├── detail.html        # Halaman detail resep
│   ├── style.css
│   └── script.js
├── backend/               # API Express
│   ├── src/
│   │   ├── index.js       # Entry point
│   │   ├── db.js          # Koneksi PostgreSQL
│   │   └── routes/
│   │       ├── bahan.js
│   │       └── resep.js
│   ├── migrations/
│   │   ├── 001_init.sql   # Skema database
│   │   └── 002_seed.sql   # Data awal (20 resep)
│   └── package.json
└── .github/workflows/
    └── deploy-pages.yml   # Auto-deploy frontend
```

## Setup Lokal

### 1. Clone & Install Dependencies

```bash
git clone <repo-url>
cd resep-makan-capstone
cd backend
npm install
```

### 2. Setup Database

Buat database PostgreSQL, lalu jalankan migration:

```bash
psql -U <user> -d <database> -f migrations/001_init.sql
psql -U <user> -d <database> -f migrations/002_seed.sql
```

### 3. Konfigurasi Environment

```bash
cp .env.example .env
# Isi DATABASE_URL dengan connection string PostgreSQL kamu
```

### 4. Jalankan Backend

```bash
npm start
```

Backend akan berjalan di `http://localhost:3000`.

### 5. Buka Frontend

Buka `frontend/index.html` di browser, atau serve dengan:

```bash
npx serve frontend
```

Update `API_BASE` di `frontend/script.js` ke URL backend lokal (`http://localhost:3000`) untuk development.

## API Endpoints

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/api/bahan` | Ambil semua daftar bahan |
| GET | `/api/resep` | Ambil semua resep (opsional `?kategori=`) |
| GET | `/api/resep/:id` | Ambil detail 1 resep lengkap |
| POST | `/api/resep/filter` | Filter resep berdasarkan bahan (`{ "bahan_ids": [1,2,3] }`) |
| POST | `/api/resep` | Tambah resep baru (admin/seed) |

## Deploy ke Railway

1. Push repo ke GitHub
2. Buat project di [Railway](https://railway.com) dari repo GitHub
3. Set **Root Directory** → `backend`
4. Tambah **PostgreSQL** database dari Railway
5. Set environment variable `DATABASE_URL` (dari tab Connect PostgreSQL)
6. Jalankan migration via Railway CLI atau langsung ke database URL
7. Update `API_BASE` di `frontend/script.js` dengan URL Railway backend

## Kriteria Selesai

- [x] Pengguna bisa memilih bahan dan mendapat daftar resep yang relevan
- [x] Halaman detail resep menampilkan bahan, takaran, dan langkah dengan jelas
- [x] Aplikasi bisa diakses publik lewat URL GitHub Pages dan Railway
- [x] Tidak ada credential yang ter-commit ke repository
- [x] README menjelaskan cara setup ulang project dari nol

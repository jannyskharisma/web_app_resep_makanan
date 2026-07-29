# PRD: Resep Makan dari Bahan Seadanya

**Dokumen**: Product Requirements Document
**Jenis proyek**: Capstone Design
**Tanggal**: 29 Juli 2026
**Status**: Draft

---

## 1. Latar Belakang

Banyak orang bingung mau masak apa hanya dengan bahan seadanya yang tersisa di dapur, sehingga akhirnya memilih jajan atau membiarkan bahan makanan terbuang sia-sia. Aplikasi resep yang ada saat ini (misalnya Cookpad) umumnya berbasis pencarian nama masakan atau kategori, bukan berbasis bahan yang benar-benar dimiliki pengguna saat itu juga.

## 2. Masalah yang Diselesaikan

> "Saya punya bahan A, B, dan C di rumah. Masakan apa yang bisa saya buat sekarang, tanpa harus belanja bahan tambahan?"

Pengguna butuh cara cepat untuk mencocokkan bahan yang tersedia dengan resep yang bisa langsung dibuat, tanpa harus scroll manual satu per satu resep dan mengecek bahannya.

## 3. Tujuan Produk

- Membantu pengguna menemukan resep yang bisa dimasak dari bahan yang mereka miliki, dalam waktu singkat.
- Mengurangi kebingungan "masak apa hari ini" dan potensi pemborosan bahan makanan.
- Menyediakan panduan memasak yang jelas dan lengkap (bahan, takaran, langkah) layaknya aplikasi resep populer.

## 4. Target Pengguna

| Persona | Kebutuhan |
|---|---|
| Anak kos / mahasiswa | Masak praktis dengan bahan terbatas dan budget minim |
| Ibu rumah tangga / keluarga muda | Variasi menu harian dari stok bahan yang ada di kulkas |
| Pemula yang baru belajar masak | Instruksi langkah-langkah yang jelas dan tidak membingungkan |

## 5. Lingkup Produk (Scope)

### 5.1 Termasuk dalam MVP (Minimum Viable Product)
- Halaman awal untuk memilih/menandai bahan yang tersedia.
- Sistem filter yang menampilkan resep sesuai bahan yang dipilih, diurutkan dari yang paling cocok.
- Halaman detail resep: nama, kategori, deskripsi, daftar bahan + takaran, langkah memasak bernomor, estimasi waktu masak, foto.
- Link video tutorial opsional di halaman detail (pelengkap, bukan pengganti konten teks).
- Minimal 15-20 resep awal yang tersedia di database.

### 5.2 Tidak Termasuk dalam MVP (kemungkinan pengembangan lanjutan)
- Akun pengguna / login.
- Fitur simpan resep favorit.
- Rating dan ulasan resep dari pengguna.
- Kontribusi resep dari pengguna lain (user-generated content).
- Rekomendasi personalisasi berbasis riwayat pencarian.

## 6. User Stories

1. **Sebagai pengguna**, saya ingin memilih bahan-bahan yang saya punya di rumah, **supaya** saya bisa lihat resep apa saja yang bisa saya masak sekarang.
2. **Sebagai pengguna**, saya ingin melihat resep diurutkan berdasarkan seberapa cocok dengan bahan saya, **supaya** saya bisa pilih yang paling sesuai tanpa harus belanja tambahan.
3. **Sebagai pengguna**, saya ingin membuka detail resep dan melihat langkah memasak yang jelas dan bernomor, **supaya** saya tidak bingung saat mengikuti instruksinya.
4. **Sebagai pengguna**, saya ingin melihat link video tutorial (jika ada), **supaya** saya bisa memvisualisasikan cara memasaknya kalau instruksi teks kurang jelas.
5. **Sebagai pengguna**, saya ingin tahu kalau bahan yang saya pilih tidak menghasilkan resep apa pun, **supaya** saya tidak menunggu tanpa kejelasan.

## 7. Kebutuhan Fungsional

| ID | Kebutuhan | Prioritas |
|---|---|---|
| F1 | Sistem menampilkan daftar bahan yang bisa dipilih pengguna | Wajib |
| F2 | Sistem memfilter dan menampilkan resep berdasarkan bahan yang dipilih | Wajib |
| F3 | Hasil filter diurutkan berdasarkan tingkat kecocokan bahan | Wajib |
| F4 | Halaman detail resep menampilkan bahan, takaran, dan langkah lengkap | Wajib |
| F5 | Halaman detail resep menampilkan foto resep | Wajib |
| F6 | Halaman detail resep menampilkan link video opsional | Sebaiknya ada |
| F7 | Sistem menampilkan pesan yang jelas jika tidak ada resep yang cocok | Wajib |
| F8 | Tampilan responsif di perangkat mobile | Wajib |

## 8. Kebutuhan Non-Fungsional

| ID | Kebutuhan |
|---|---|
| N1 | Waktu respon filter resep di bawah 2 detik untuk kondisi jaringan normal |
| N2 | Kredensial database tidak boleh terekspos di kode/frontend |
| N3 | Aplikasi dapat diakses gratis (hosting frontend & backend tanpa biaya) |
| N4 | Data resep tersimpan dan tidak hilang meski server restart |

## 9. Metrik Keberhasilan

Karena ini proyek capstone (bukan produk komersial), metrik keberhasilan difokuskan pada penyelesaian fungsional dan kualitas demo, misalnya:

- Semua kebutuhan fungsional (F1-F8) berhasil diimplementasikan dan berjalan tanpa error saat demo.
- Minimal 15-20 resep tersedia dan bisa difilter dengan benar dari berbagai kombinasi bahan.
- Aplikasi bisa diakses secara publik lewat URL (bukan hanya jalan di localhost).
- Mendapat penilaian baik dari dosen pembimbing/penguji terkait manfaat dan kelengkapan fitur.

## 10. Asumsi

- Pengguna mengakses aplikasi lewat browser modern (Chrome, Firefox, Safari versi terbaru).
- Data resep diinput secara manual oleh tim pengembang (bukan dari user submission) untuk versi MVP.
- Tidak ada kebutuhan multi-bahasa; aplikasi berbahasa Indonesia saja untuk versi awal.

## 11. Risiko & Mitigasi

| Risiko | Mitigasi |
|---|---|
| Jumlah resep terlalu sedikit sehingga filter sering kosong | Prioritaskan bahan-bahan umum saat menulis resep awal, uji berbagai kombinasi sebelum demo |
| Free tier hosting (Railway) punya limit penggunaan | Pantau usage, pastikan sesuai batas gratis sebelum deadline |
| Konten resep dianggap terlalu mirip sumber referensi | Tulis ulang dengan kata-kata sendiri, jangan copy-paste langsung dari sumber |
| CORS/koneksi frontend-backend bermasalah saat deploy | Uji integrasi sejak awal, jangan tunggu sampai akhir pengerjaan |

## 12. Referensi Teknis

Detail arsitektur, skema database, spesifikasi API, dan struktur folder tersedia di dokumen terpisah: `plan.md`.

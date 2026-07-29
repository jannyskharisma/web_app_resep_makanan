const express = require('express');
const pool = require('../db');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const { kategori } = req.query;
    let query = 'SELECT id, nama, kategori, deskripsi, image_url, waktu_masak FROM resep';
    const params = [];
    if (kategori) {
      query += ' WHERE kategori = $1';
      params.push(kategori);
    }
    query += ' ORDER BY nama ASC';
    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching resep:', err);
    res.status(500).json({ error: 'Gagal mengambil daftar resep' });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    if (!/^\d+$/.test(id)) {
      return res.status(400).json({ error: 'ID harus berupa angka' });
    }

    const resepResult = await pool.query('SELECT * FROM resep WHERE id = $1', [id]);
    if (resepResult.rows.length === 0) {
      return res.status(404).json({ error: 'Resep tidak ditemukan' });
    }

    const bahanResult = await pool.query(
      `SELECT b.id, b.nama_bahan, rb.jumlah, rb.satuan
       FROM resep_bahan rb
       JOIN bahan b ON b.id = rb.bahan_id
       WHERE rb.resep_id = $1
       ORDER BY b.nama_bahan ASC`,
      [id]
    );

    const resep = resepResult.rows[0];
    resep.bahan = bahanResult.rows;
    res.json(resep);
  } catch (err) {
    console.error('Error fetching resep detail:', err);
    res.status(500).json({ error: 'Gagal mengambil detail resep' });
  }
});

router.post('/filter', async (req, res) => {
  try {
    const { bahan_ids } = req.body;

    if (!Array.isArray(bahan_ids)) {
      return res.status(400).json({ error: 'bahan_ids harus berupa array' });
    }
    if (bahan_ids.length === 0) {
      return res.status(400).json({ error: 'bahan_ids tidak boleh kosong' });
    }
    for (const id of bahan_ids) {
      if (!Number.isInteger(id) || id <= 0) {
        return res.status(400).json({ error: 'bahan_ids harus berisi integer positif' });
      }
    }

    const result = await pool.query(
      `SELECT
         r.id, r.nama, r.kategori, r.deskripsi, r.image_url, r.waktu_masak,
         COALESCE(match_data.jumlah_cocok, 0) AS jumlah_cocok,
         (SELECT COUNT(*) FROM resep_bahan WHERE resep_id = r.id) AS total_bahan
       FROM resep r
       LEFT JOIN (
         SELECT rb.resep_id, COUNT(rb.bahan_id) AS jumlah_cocok
         FROM resep_bahan rb
         WHERE rb.bahan_id = ANY($1)
         GROUP BY rb.resep_id
       ) match_data ON match_data.resep_id = r.id
       WHERE match_data.jumlah_cocok > 0
       ORDER BY jumlah_cocok DESC, r.nama ASC`,
      [bahan_ids]
    );

    res.json(result.rows);
  } catch (err) {
    console.error('Error filtering resep:', err);
    res.status(500).json({ error: 'Gagal memfilter resep' });
  }
});

router.post('/', async (req, res) => {
  try {
    const { nama, kategori, deskripsi, langkah, waktu_masak, video_url, image_url, bahan } = req.body;

    if (!nama || !langkah) {
      return res.status(400).json({ error: 'nama dan langkah wajib diisi' });
    }

    const resepResult = await pool.query(
      `INSERT INTO resep (nama, kategori, deskripsi, langkah, waktu_masak, video_url, image_url)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       RETURNING id`,
      [nama, kategori || null, deskripsi || null, langkah, waktu_masak || null, video_url || null, image_url || null]
    );
    const resepId = resepResult.rows[0].id;

    if (bahan && bahan.length > 0) {
      for (const item of bahan) {
        await pool.query(
          'INSERT INTO resep_bahan (resep_id, bahan_id, jumlah, satuan) VALUES ($1, $2, $3, $4)',
          [resepId, item.bahan_id, item.jumlah || null, item.satuan || null]
        );
      }
    }

    res.status(201).json({ id: resepId, message: 'Resep berhasil ditambahkan' });
  } catch (err) {
    console.error('Error creating resep:', err);
    res.status(500).json({ error: 'Gagal menambahkan resep' });
  }
});

module.exports = router;

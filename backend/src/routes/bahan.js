const express = require('express');
const pool = require('../db');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT id, nama_bahan FROM bahan ORDER BY nama_bahan ASC');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching bahan:', err);
    res.status(500).json({ error: 'Gagal mengambil daftar bahan' });
  }
});

module.exports = router;

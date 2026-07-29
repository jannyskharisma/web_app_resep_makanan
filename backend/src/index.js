const express = require('express');
const cors = require('cors');
const bahanRoutes = require('./routes/bahan');
const resepRoutes = require('./routes/resep');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'API Resep Makan dari Bahan Seadanya' });
});

app.use('/api/bahan', bahanRoutes);
app.use('/api/resep', resepRoutes);

app.use((err, req, res, next) => {
  console.error('Unhandled error:', err);
  res.status(500).json({ error: 'Terjadi kesalahan server' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

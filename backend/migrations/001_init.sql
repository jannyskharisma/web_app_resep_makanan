CREATE TABLE IF NOT EXISTS resep (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(150) NOT NULL,
  kategori VARCHAR(50),
  deskripsi TEXT,
  langkah TEXT NOT NULL,
  waktu_masak INT,
  video_url VARCHAR(255),
  image_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS bahan (
  id SERIAL PRIMARY KEY,
  nama_bahan VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS resep_bahan (
  resep_id INT NOT NULL REFERENCES resep(id) ON DELETE CASCADE,
  bahan_id INT NOT NULL REFERENCES bahan(id) ON DELETE CASCADE,
  jumlah NUMERIC(10,2),
  satuan VARCHAR(20),
  PRIMARY KEY (resep_id, bahan_id)
);

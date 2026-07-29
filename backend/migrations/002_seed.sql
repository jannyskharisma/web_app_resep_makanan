INSERT INTO bahan (nama_bahan) VALUES
('Nasi'),
('Telur'),
('Bawang Putih'),
('Bawang Merah'),
('Garam'),
('Merica Bubuk'),
('Kecap Manis'),
('Minyak Goreng'),
('Tempe'),
('Tahu'),
('Mie Instan'),
('Kangkung'),
('Sawi Hijau'),
('Wortel'),
('Brokoli'),
('Buncis'),
('Kentang'),
('Tomat'),
('Cabai Merah'),
('Cabai Rawit'),
('Ayam'),
('Sosis'),
('Daun Bawang'),
('Seledri'),
('Gula Pasir'),
('Penyedap Rasa'),
('Kunyit'),
('Lengkuas'),
('Daun Salam'),
('Kecap Asin'),
('Saos Tiram'),
('Jahe'),
('Kol'),
('Air'),
('Tepung Terigu'),
('Bayam'),
('Jagung'),
('Kacang Panjang'),
('Tepung Beras'),
('Kemiri'),
('Ketumbar'),
('Terasi'),
('Santan'),
('Serai'),
('Daun Jeruk'),
('Minyak Wijen'),
('Labu'),
('Saus Sambal')
ON CONFLICT (nama_bahan) DO NOTHING;

INSERT INTO resep (nama, kategori, deskripsi, langkah, waktu_masak, video_url, image_url) VALUES
(
  'Nasi Goreng Sederhana',
  'Makanan Utama',
  'Nasi goreng klasik dengan bahan minimalis, cocok untuk sarapan atau makan malam cepat.',
  '1. Panaskan minyak di wajan.\n2. Tumis bawang putih dan bawang merah hingga harum.\n3. Masukkan telur, orak-arik hingga matang.\n4. Tambahkan nasi, kecap manis, garam, dan merica.\n5. Aduk rata hingga nasi tercampur bumbu.\n6. Angkat dan sajikan dengan taburan bawang goreng.',
  15,
  'https://www.youtube.com/watch?v=example1',
  'https://placehold.co/400x300/FF6B6B/ffffff?text=Nasi+Goreng'
),
(
  'Telur Dadar Crispy',
  'Lauk',
  'Telur dadar sederhana dengan pinggiran renyah, cocok sebagai lauk pendamping nasi.',
  '1. Kocok lepas telur bersama garam dan merica.\n2. Panaskan minyak banyak di wajan.\n3. Tuang telur ke wajan panas.\n4. Masak hingga pinggiran kecokelatan dan renyah.\n5. Balik sebentar, lalu angkat dan tiriskan.\n6. Sajikan hangat.',
  10,
  NULL,
  'https://placehold.co/400x300/FFA500/ffffff?text=Telur+Dadar'
),
(
  'Tempe Goreng Tepung',
  'Lauk',
  'Tempe goreng berlapis tepung yang gurih dan renyah di luar, lembut di dalam.',
  '1. Iris tempe tipis-tipis.\n2. Campur tepung terigu, garam, merica, dan air hingga menjadi adonan kental.\n3. Celupkan tempe ke dalam adonan tepung.\n4. Goreng dalam minyak panas hingga kuning keemasan.\n5. Angkat dan tiriskan.\n6. Sajikan dengan cabai rawit atau sambal.',
  15,
  NULL,
  'https://placehold.co/400x300/8B4513/ffffff?text=Tempe+Goreng'
),
(
  'Tahu Goreng Crispy',
  'Lauk',
  'Tahu goreng tepung yang renyah di luar dan lembut di dalam. Cocok untuk lauk atau camilan.',
  '1. Potong tahu menjadi kotak-kotak kecil.\n2. Campur tepung terigu, garam, merica, dan air.\n3. Celupkan tahu ke adonan tepung.\n4. Goreng dalam minyak panas hingga kecokelatan.\n5. Angkat dan tiriskan.\n6. Sajikan dengan saus sambal.',
  10,
  NULL,
  'https://placehold.co/400x300/F5DEB3/000000?text=Tahu+Goreng'
),
(
  'Mie Goreng Spesial',
  'Makanan Utama',
  'Mie instan digoreng dengan tambahan telur dan sayuran untuk menu praktis yang lebih bergizi.',
  '1. Rebus mie instan setengah matang, tiriskan.\n2. Panaskan minyak, tumis bawang putih dan bawang merah.\n3. Masukkan telur, orak-arik.\n4. Tambahkan sayuran (wortel, kol), aduk hingga layu.\n5. Masukkan mie dan bumbu instan, aduk rata.\n6. Tambahkan kecap manis, aduk hingga matang.\n7. Angkat dan sajikan.',
  15,
  NULL,
  'https://placehold.co/400x300/FFD700/000000?text=Mie+Goreng'
),
(
  'Sayur Sop',
  'Sayur',
  'Sop sayuran segar dengan kuah bening yang ringan dan menyehatkan.',
  '1. Rebus air hingga mendidih.\n2. Masukkan wortel dan kentang, rebus hingga empuk.\n3. Tambahkan kol, buncis, dan daun bawang.\n4. Bumbui dengan garam, merica, dan penyedap rasa.\n5. Masukkan seledri, aduk sebentar.\n6. Angkat dan sajikan hangat.',
  25,
  'https://www.youtube.com/watch?v=example2',
  'https://placehold.co/400x300/90EE90/000000?text=Sayur+Sop'
),
(
  'Tumis Kangkung',
  'Sayur',
  'Tumis kangkung sederhana dengan bawang putih dan cabai, masakan rumahan yang paling praktis.',
  '1. Petik dan cuci bersih kangkung.\n2. Iris bawang putih, bawang merah, dan cabai.\n3. Panaskan minyak, tumis bumbu iris hingga harum.\n4. Masukkan kangkung, aduk cepat.\n5. Tambahkan garam, merica, dan sedikit air.\n6. Masak hingga layu, angkat dan sajikan.',
  10,
  NULL,
  'https://placehold.co/400x300/228B22/ffffff?text=Tumis+Kangkung'
),
(
  'Capcay Sederhana',
  'Sayur',
  'Capcay sayuran dengan kuah kental, cocok untuk menemani nasi hangat.',
  '1. Potong wortel, brokoli, buncis, kol, dan jagung muda.\n2. Panaskan minyak, tumis bawang putih hingga harum.\n3. Masukkan wortel dan jagung muda, masak sebentar.\n4. Tambahkan sayuran lainnya, aduk rata.\n5. Tuang sedikit air, tambahkan garam, merica, dan saos tiram.\n6. Masak hingga sayuran matang tapi masih renyah.\n7. Kentalkan dengan larutan tepung maizena jika suka.\n8. Angkat dan sajikan.',
  20,
  NULL,
  'https://placehold.co/400x300/FF6347/ffffff?text=Capcay'
),
(
  'Telur Balado',
  'Lauk',
  'Telur rebus yang digoreng kemudian disiram sambal balado pedas menggugah selera.',
  '1. Rebus telur hingga matang, kupas kulitnya.\n2. Goreng telur sebentar hingga berkulit.\n3. Haluskan cabai merah, bawang merah, bawang putih, dan tomat.\n4. Tumis bumbu halus hingga harum.\n5. Tambahkan garam, gula, dan sedikit air.\n6. Masukkan telur, aduk rata hingga bumbu meresap.\n7. Angkat dan sajikan.',
  25,
  NULL,
  'https://placehold.co/400x300/DC143C/ffffff?text=Telur+Balado'
),
(
  'Tempe Orek',
  'Lauk',
  'Tempe orek manis pedas yang awet disimpan, cocok untuk bekal atau lauk darurat.',
  '1. Potong tempe kecil-kecil memanjang.\n2. Goreng tempe hingga setengah kering, tiriskan.\n3. Iris bawang merah, bawang putih, dan cabai.\n4. Tumis bumbu iris hingga harum.\n5. Masukkan tempe, kecap manis, garam, dan merica.\n6. Aduk rata, tambahkan sedikit air.\n7. Masak hingga bumbu meresap dan air menyusut.\n8. Angkat dan sajikan.',
  20,
  NULL,
  'https://placehold.co/400x300/DEB887/000000?text=Tempe+Orek'
),
(
  'Tahu Tumis Kecap',
  'Lauk',
  'Tahu yang ditumis dengan kecap manis dan bumbu sederhana, cepat dan enak.',
  '1. Potong tahu kotak-kotak, goreng setengah matang.\n2. Iris bawang merah, bawang putih, cabai, dan daun bawang.\n3. Tumis bumbu iris hingga harum.\n4. Masukkan tahu, kecap manis, kecap asin, garam, merica.\n5. Aduk rata, tambahkan sedikit air.\n6. Masak hingga bumbu meresap.\n7. Angkat, taburi bawang goreng, sajikan.',
  15,
  NULL,
  'https://placehold.co/400x300/FFE4B5/000000?text=Tahu+Tumis+Kecap'
),
(
  'Sup Ayam',
  'Makanan Utama',
  'Sup ayam bening dengan sayuran, hangat dan cocok untuk saat badan kurang fit.',
  '1. Potong ayam kecil-kecil, cuci bersih.\n2. Rebus ayam dengan air hingga matang dan empuk.\n3. Masukkan wortel dan kentang yang sudah dipotong.\n4. Tambahkan kol, daun bawang, dan seledri.\n5. Bumbui dengan garam, merica, penyedap rasa.\n6. Masak hingga semua sayuran empuk.\n7. Angkat dan sajikan hangat dengan taburan bawang goreng.',
  35,
  'https://www.youtube.com/watch?v=example3',
  'https://placehold.co/400x300/F0E68C/000000?text=Sup+Ayam'
),
(
  'Perkedel Kentang',
  'Lauk',
  'Perkedel kentang yang lembut di dalam dan renyah di luar, cocok sebagai lauk atau camilan.',
  '1. Kupas dan rebus kentang hingga empuk.\n2. Haluskan kentang selagi panas.\n3. Campur dengan telur, daun bawang iris, garam, dan merica.\n4. Aduk rata, bentuk bulat pipih.\n5. Celupkan ke kocokan telur.\n6. Goreng dalam minyak panas hingga kecokelatan.\n7. Angkat dan tiriskan. Sajikan hangat.',
  25,
  NULL,
  'https://placehold.co/400x300/F4A460/ffffff?text=Perkedel+Kentang'
),
(
  'Tumis Buncis',
  'Sayur',
  'Tumis buncis sederhana dengan bawang putih dan cabai, sayuran cepat dan praktis.',
  '1. Potong buncis serong tipis.\n2. Iris bawang putih, bawang merah, dan cabai.\n3. Panaskan minyak, tumis bumbu hingga harum.\n4. Masukkan buncis, aduk rata.\n5. Tambahkan garam, merica, dan sedikit air.\n6. Masak hingga buncis matang tapi masih renyah.\n7. Angkat dan sajikan.',
  10,
  NULL,
  'https://placehold.co/400x300/556B2F/ffffff?text=Tumis+Buncis'
),
(
  'Cah Brokoli',
  'Sayur',
  'Brokoli cah bawang putih yang sederhana, sehat, dan cepat dibuat.',
  '1. Potong brokoli per kuntum, cuci bersih.\n2. Cincang bawang putih.\n3. Panaskan minyak, tumis bawang putih hingga harum.\n4. Masukkan brokoli, aduk rata.\n5. Tambahkan garam, merica, dan sedikit air.\n6. Masak sebentar hingga brokoli matang tapi masih hijau segar.\n7. Angkat dan sajikan.',
  10,
  NULL,
  'https://placehold.co/400x300/2E8B57/ffffff?text=Cah+Brokoli'
),
(
  'Oseng Tempe Tahu',
  'Lauk',
  'Oseng tempe dan tahu dengan bumbu kecap pedas manis, protein murah dan mengenyangkan.',
  '1. Potong tempe dan tahu kotak-kotak.\n2. Goreng setengah matang, tiriskan.\n3. Iris bawang merah, bawang putih, cabai, dan daun bawang.\n4. Tumis bumbu iris hingga harum.\n5. Masukkan tempe dan tahu, aduk rata.\n6. Tambahkan kecap manis, garam, merica, penyedap rasa.\n7. Aduk hingga bumbu merata dan meresap.\n8. Angkat dan sajikan.',
  15,
  NULL,
  'https://placehold.co/400x300/D2691E/ffffff?text=Oseng+Tempe+Tahu'
),
(
  'Sayur Bayam',
  'Sayur',
  'Sayur bayam bening dengan bawang putih dan temu kunci, sayuran rumahan favorit.',
  '1. Petik daun bayam, cuci bersih.\n2. Iris bawang merah dan bawang putih.\n3. Rebus air hingga mendidih.\n4. Masukkan bawang dan jagung yang sudah dipotong.\n5. Setelah jagung empuk, masukkan bayam.\n6. Tambahkan garam, gula, dan penyedap rasa.\n7. Aduk sebentar, angkat segera agar bayam tidak terlalu layu.\n8. Sajikan hangat.',
  15,
  NULL,
  'https://placehold.co/400x300/006400/ffffff?text=Sayur+Bayam'
),
(
  'Tumis Sawi Hijau',
  'Sayur',
  'Tumis sawi hijau dengan bawang putih dan cabai, sayuran sederhana yang cepat matang.',
  '1. Potong sawi hijau, cuci bersih.\n2. Iris bawang putih, bawang merah, dan cabai.\n3. Panaskan minyak, tumis bumbu hingga harum.\n4. Masukkan sawi hijau, aduk cepat.\n5. Tambahkan garam, merica, dan sedikit air.\n6. Masak hingga layu, angkat dan sajikan.',
  8,
  NULL,
  'https://placehold.co/400x300/7CFC00/000000?text=Tumis+Sawi'
),
(
  'Nasi Goreng Kampung',
  'Makanan Utama',
  'Nasi goreng ala kampung dengan tambahan sayuran dan terasi, aroma menggoda.',
  '1. Haluskan bawang putih, bawang merah, cabai, dan terasi.\n2. Panaskan minyak, tumis bumbu halus hingga harum.\n3. Masukkan telur, orak-arik.\n4. Tambahkan nasi, sayuran iris, garam, merica.\n5. Aduk rata hingga tercampur sempurna.\n6. Tambahkan kecap manis, aduk lagi.\n7. Angkat dan sajikan dengan kerupuk.',
  15,
  NULL,
  'https://placehold.co/400x300/8B0000/ffffff?text=Nasi+Goreng+Kampung'
),
(
  'Sayur Lodeh',
  'Sayur',
  'Sayur lodeh dengan santan dan berbagai sayuran, masakan rumahan yang mengenyangkan.',
  '1. Potong labu, kacang panjang, jagung, dan daun melinjo.\n2. Haluskan bawang merah, bawang putih, kemiri, ketumbar.\n3. Panaskan minyak, tumis bumbu halus dengan lengkuas dan daun salam.\n4. Masukkan santan dan air, aduk agar tidak pecah.\n5. Masukkan sayuran keras (labu, jagung) terlebih dahulu.\n6. Setelah empuk, masukkan kacang panjang dan sayuran lainnya.\n7. Bumbui garam, gula, dan penyedap rasa.\n8. Masak hingga matang, angkat dan sajikan.',
  30,
  NULL,
  'https://placehold.co/400x300/FFE4B5/000000?text=Sayur+Lodeh'
);

INSERT INTO resep_bahan (resep_id, bahan_id, jumlah, satuan) VALUES
-- Nasi Goreng Sederhana (resep_id=1)
(1, (SELECT id FROM bahan WHERE nama_bahan='Nasi'), 2.0, 'piring'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 1.0, 'butir'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 3.0, 'siung'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 2.0, 'sdm'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(1, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Telur Dadar Crispy (resep_id=2)
(2, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 2.0, 'butir'),
(2, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(2, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(2, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 3.0, 'sdm'),

-- Tempe Goreng Tepung (resep_id=3)
(3, (SELECT id FROM bahan WHERE nama_bahan='Tempe'), 1.0, 'papan'),
(3, (SELECT id FROM bahan WHERE nama_bahan='Tepung Terigu'), 100.0, 'gram'),
(3, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(3, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(3, (SELECT id FROM bahan WHERE nama_bahan='Air'), 100.0, 'ml'),
(3, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 200.0, 'ml'),

-- Tahu Goreng Crispy (resep_id=4)
(4, (SELECT id FROM bahan WHERE nama_bahan='Tahu'), 2.0, 'buah'),
(4, (SELECT id FROM bahan WHERE nama_bahan='Tepung Terigu'), 100.0, 'gram'),
(4, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(4, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(4, (SELECT id FROM bahan WHERE nama_bahan='Air'), 80.0, 'ml'),
(4, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 200.0, 'ml'),

-- Mie Goreng Spesial (resep_id=5)
(5, (SELECT id FROM bahan WHERE nama_bahan='Mie Instan'), 1.0, 'bungkus'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 1.0, 'butir'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Wortel'), 0.5, 'buah'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Kol'), 2.0, 'lembar'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 1.0, 'sdm'),
(5, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Sayur Sop (resep_id=6)
(6, (SELECT id FROM bahan WHERE nama_bahan='Wortel'), 1.0, 'buah'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Kentang'), 1.0, 'buah'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Kol'), 3.0, 'lembar'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Buncis'), 5.0, 'batang'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Daun Bawang'), 1.0, 'batang'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Seledri'), 1.0, 'batang'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Penyedap Rasa'), 0.25, 'sdt'),
(6, (SELECT id FROM bahan WHERE nama_bahan='Air'), 500.0, 'ml'),

-- Tumis Kangkung (resep_id=7)
(7, (SELECT id FROM bahan WHERE nama_bahan='Kangkung'), 1.0, 'ikat'),
(7, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(7, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(7, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(7, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(7, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 1.0, 'sdm'),

-- Capcay Sederhana (resep_id=8)
(8, (SELECT id FROM bahan WHERE nama_bahan='Wortel'), 1.0, 'buah'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Brokoli'), 1.0, 'buah'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Buncis'), 5.0, 'batang'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Kol'), 3.0, 'lembar'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 3.0, 'siung'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Saos Tiram'), 1.0, 'sdm'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(8, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Telur Balado (resep_id=9)
(9, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 4.0, 'butir'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 5.0, 'buah'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 4.0, 'siung'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Tomat'), 1.0, 'buah'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Gula Pasir'), 0.5, 'sdt'),
(9, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 3.0, 'sdm'),

-- Tempe Orek (resep_id=10)
(10, (SELECT id FROM bahan WHERE nama_bahan='Tempe'), 1.0, 'papan'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 3.0, 'sdm'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 3.0, 'siung'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 3.0, 'buah'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(10, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Tahu Tumis Kecap (resep_id=11)
(11, (SELECT id FROM bahan WHERE nama_bahan='Tahu'), 3.0, 'buah'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 2.0, 'sdm'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Kecap Asin'), 1.0, 'sdm'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Daun Bawang'), 1.0, 'batang'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(11, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Sup Ayam (resep_id=12)
(12, (SELECT id FROM bahan WHERE nama_bahan='Ayam'), 250.0, 'gram'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Wortel'), 1.0, 'buah'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Kentang'), 1.0, 'buah'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Kol'), 3.0, 'lembar'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Daun Bawang'), 1.0, 'batang'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Seledri'), 1.0, 'batang'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 1.0, 'sdt'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.5, 'sdt'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Penyedap Rasa'), 0.5, 'sdt'),
(12, (SELECT id FROM bahan WHERE nama_bahan='Air'), 750.0, 'ml'),

-- Perkedel Kentang (resep_id=13)
(13, (SELECT id FROM bahan WHERE nama_bahan='Kentang'), 3.0, 'buah'),
(13, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 1.0, 'butir'),
(13, (SELECT id FROM bahan WHERE nama_bahan='Daun Bawang'), 1.0, 'batang'),
(13, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(13, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(13, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 100.0, 'ml'),

-- Tumis Buncis (resep_id=14)
(14, (SELECT id FROM bahan WHERE nama_bahan='Buncis'), 200.0, 'gram'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(14, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 1.0, 'sdm'),

-- Cah Brokoli (resep_id=15)
(15, (SELECT id FROM bahan WHERE nama_bahan='Brokoli'), 1.0, 'buah'),
(15, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 3.0, 'siung'),
(15, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(15, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(15, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 1.0, 'sdm'),

-- Oseng Tempe Tahu (resep_id=16)
(16, (SELECT id FROM bahan WHERE nama_bahan='Tempe'), 0.5, 'papan'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Tahu'), 1.0, 'buah'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 2.0, 'sdm'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Daun Bawang'), 1.0, 'batang'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(16, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Sayur Bayam (resep_id=17)
(17, (SELECT id FROM bahan WHERE nama_bahan='Bayam'), 1.0, 'ikat'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Jagung'), 0.5, 'buah'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 1.0, 'siung'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Gula Pasir'), 0.5, 'sdt'),
(17, (SELECT id FROM bahan WHERE nama_bahan='Air'), 400.0, 'ml'),

-- Tumis Sawi Hijau (resep_id=18)
(18, (SELECT id FROM bahan WHERE nama_bahan='Sawi Hijau'), 1.0, 'ikat'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 2.0, 'siung'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.25, 'sdt'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Merica Bubuk'), 0.25, 'sdt'),
(18, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 1.0, 'sdm'),

-- Nasi Goreng Kampung (resep_id=19)
(19, (SELECT id FROM bahan WHERE nama_bahan='Nasi'), 2.0, 'piring'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Telur'), 1.0, 'butir'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 3.0, 'siung'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Cabai Merah'), 2.0, 'buah'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Terasi'), 0.5, 'sdt'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Kecap Manis'), 2.0, 'sdm'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 0.5, 'sdt'),
(19, (SELECT id FROM bahan WHERE nama_bahan='Minyak Goreng'), 2.0, 'sdm'),

-- Sayur Lodeh (resep_id=20)
(20, (SELECT id FROM bahan WHERE nama_bahan='Labu'), 100.0, 'gram'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Kacang Panjang'), 5.0, 'batang'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Jagung'), 1.0, 'buah'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Santan'), 500.0, 'ml'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Bawang Merah'), 3.0, 'siung'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Bawang Putih'), 2.0, 'siung'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Kemiri'), 2.0, 'butir'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Lengkuas'), 1.0, 'ruas'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Daun Salam'), 1.0, 'lembar'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Garam'), 1.0, 'sdt'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Gula Pasir'), 0.5, 'sdt'),
(20, (SELECT id FROM bahan WHERE nama_bahan='Air'), 200.0, 'ml');

-- Database Schema untuk Artikel Dinamis

-- Table: articles (Artikel dengan konten dinamis)
CREATE TABLE articles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  website_id INTEGER NOT NULL REFERENCES websites(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL,
  author VARCHAR(100) NOT NULL,
  minute_read INTEGER NOT NULL DEFAULT 5,
  category VARCHAR(50) NOT NULL,
  thumbnail_image VARCHAR(500) NOT NULL,
  main_image VARCHAR(500),
  summary TEXT,
  content JSONB NOT NULL, -- Menyimpan konten dinamis dalam format JSON
  visit_count INTEGER DEFAULT 0, -- Menambahkan kolom visit_count untuk menghitung jumlah kunjungan
  is_published BOOLEAN DEFAULT false,
  published_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(website_id, slug)
);

-- Contoh struktur content JSONB:
/*
[
  {
    "type": "text",
    "content": "<p>Paragraf teks dengan format HTML</p>"
  },
  {
    "type": "heading",
    "content": "Judul Bagian",
    "level": 2
  },
  {
    "type": "image",
    "url": "https://example.com/image.jpg",
    "caption": "Keterangan gambar",
    "alt": "Teks alternatif"
  },
  {
    "type": "quote",
    "content": "Ini adalah kutipan",
    "source": "Nama Sumber"
  }
]
*/

-- Indeks untuk performa
CREATE INDEX idx_articles_website_id ON articles(website_id);
CREATE INDEX idx_articles_category ON articles(website_id, category);
CREATE INDEX idx_articles_published ON articles(website_id, is_published, published_at);
CREATE INDEX idx_articles_visit_count ON articles(website_id, visit_count); -- Indeks untuk visit_count

-- Enable Row Level Security (RLS)
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- Create policies untuk read access (public)
CREATE POLICY "Allow public read access to published articles" 
  ON articles 
  FOR SELECT 
  USING (is_published = true);

-- Create policies untuk write access (authenticated users)
CREATE POLICY "Allow authenticated users to manage articles" 
  ON articles 
  USING (auth.role() = 'authenticated');

-- Create trigger untuk update timestamp
CREATE TRIGGER update_articles_updated_at 
  BEFORE UPDATE ON articles 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();

-- Table: comments (Komentar artikel)
CREATE TABLE comments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  article_id UUID NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
  author_name VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  is_approved BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes untuk comments
CREATE INDEX idx_comments_article_id ON comments(article_id);
CREATE INDEX idx_comments_article_created_at ON comments(article_id, created_at DESC);

-- Enable Row Level Security (RLS) untuk comments
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Policy: publik bisa baca komentar yang disetujui
CREATE POLICY "Allow public read approved comments" 
  ON comments 
  FOR SELECT 
  USING (is_approved = true);

-- Policy: anon bisa menambah komentar
CREATE POLICY "Allow anon insert comments" 
  ON comments 
  FOR INSERT 
  WITH CHECK (
    -- Minimal validasi sederhana agar tidak kosong
    char_length(trim(content)) > 0 AND char_length(trim(author_name)) > 0
  );

-- Sample data untuk articles
INSERT INTO articles (website_id, title, slug, author, minute_read, category, thumbnail_image, main_image, summary, content, visit_count, is_published, published_at) VALUES
(1, 'Nasi Kerabu: Hidangan Ikonik Kelantan', 'nasi-kerabu-hidangan-ikonik-kelantan', 'Sarah Chen', 8, 'food', 
 'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=400&h=300&fit=crop',
 'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=800&h=500&fit=crop',
 'Nasi Kerabu adalah hidangan nasi berwarna biru yang disajikan dengan berbagai lauk pauk dan sayuran segar.',
 '[{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\"><span class=\"text-4xl font-serif text-primary-500 float-left mr-3 mt-1\">N</span>asi Kerabu adalah hidangan ikonik dari Kelantan yang terkenal dengan warna biru alaminya. Nasi ini mendapatkan warna birunya dari bunga telang (butterfly pea flower) yang dicampurkan saat memasak nasi.</p>"},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Hidangan ini biasanya disajikan dengan berbagai lauk pauk dan sayuran segar, seperti ayam, ikan, telur, dan berbagai jenis sayuran hijau. Nasi Kerabu juga sering disajikan dengan sambal dan budu (saus ikan fermentasi) yang memberikan cita rasa khas.</p>"},{"type":"heading","content":"Sejarah Nasi Kerabu","level":2},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Nasi Kerabu berasal dari negeri Kelantan di Malaysia timur. Hidangan ini telah menjadi bagian dari budaya kuliner Kelantan selama berabad-abad dan merupakan salah satu hidangan yang paling dicari oleh wisatawan yang berkunjung ke daerah ini.</p>"},{"type":"image","url":"https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=600&h=400&fit=crop","caption":"Nasi Kerabu dengan lauk pauk tradisional","alt":"Hidangan Nasi Kerabu khas Kelantan"},{"type":"heading","content":"Cara Menikmati Nasi Kerabu","level":2},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Untuk menikmati Nasi Kerabu dengan cara tradisional, campurkan semua bahan yang disajikan dengan nasi menggunakan tangan kanan Anda. Pastikan untuk mencampur nasi, sayuran, dan lauk pauk secara merata untuk mendapatkan cita rasa yang seimbang.</p>"},{"type":"quote","content":"Nasi Kerabu adalah cerminan dari kekayaan kuliner Kelantan yang menggabungkan berbagai rasa, tekstur, dan warna dalam satu hidangan.","source":"Chef Ahmad Rahman"}]',
 125, true, '2023-04-26 08:00:00+00'),
  
(1, 'Kopi Terbaik di Kelantan - 15 Coffee Shop Wajib Coba', 'kopi-terbaik-di-kelantan', 'Ahmad Rahman', 10, 'cafe', 
 'https://images.unsplash.com/photo-1504674900240-9a9049b7d8ce?w=400&h=300&fit=crop',
 'https://images.unsplash.com/photo-1504674900240-9a9049b7d8ce?w=800&h=500&fit=crop',
 'Temukan 15 coffee shop terbaik di Kelantan yang menawarkan pengalaman kopi yang unik dan lezat.',
 '[{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\"><span class=\"text-4xl font-serif text-primary-500 float-left mr-3 mt-1\">K</span>opi adalah bagian tak terpisahkan dari budaya Malaysia, dan Kelantan memiliki scene kopi yang berkembang pesat dengan berbagai coffee shop yang menawarkan pengalaman unik.</p>"},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Dari specialty coffee hingga kedai kopi tradisional, Kelantan memiliki berbagai pilihan untuk para pecinta kopi. Berikut adalah 15 coffee shop terbaik yang wajib Anda kunjungi saat berada di Kelantan.</p>"},{"type":"heading","content":"1. Brew & Bread - Georgetown","level":2},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Terletak di jantung Georgetown, Brew & Bread menawarkan kopi specialty dengan biji yang dipanggang sendiri. Suasana yang nyaman dan barista yang ramah membuat tempat ini menjadi favorit para penikmat kopi.</p>"},{"type":"image","url":"https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop","caption":"Interior Brew & Bread Coffee Shop","alt":"Suasana di dalam Brew & Bread Coffee Shop"}]',
 98, true, '2023-04-25 10:30:00+00'),
  
(1, 'George Town Festival 2024 - Festival Seni dan Budaya Terbesar', 'george-town-festival-2024', 'Lisa Wong', 7, 'events', 
 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=400&h=300&fit=crop',
 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=800&h=500&fit=crop',
 'George Town Festival adalah festival seni dan budaya tahunan yang diadakan di George Town, Kelantan.',
 '[{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\"><span class=\"text-4xl font-serif text-primary-500 float-left mr-3 mt-1\">G</span>eorge Town Festival adalah festival seni dan budaya tahunan yang diadakan di George Town, Kelantan. Festival ini menampilkan berbagai pertunjukan seni, pameran, dan acara budaya yang menarik.</p>"},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Sejak pertama kali diadakan pada tahun 2010, George Town Festival telah menjadi salah satu festival seni dan budaya terbesar di Asia Tenggara, menarik pengunjung dari berbagai negara.</p>"},{"type":"heading","content":"Sejarah Festival","level":2},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">George Town Festival pertama kali diadakan untuk memperingati penetapan George Town sebagai Situs Warisan Dunia UNESCO. Sejak saat itu, festival ini telah berkembang menjadi acara budaya yang dinantikan setiap tahun.</p>"},{"type":"image","url":"https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=600&h=400&fit=crop","caption":"Pertunjukan seni di George Town Festival","alt":"Pertunjukan seni dan budaya di George Town Festival"}]',
 75, true, '2023-04-24 09:15:00+00'),
  
(1, 'Resep Nasi Lemak Terbaik - Masakan Tradisional Malaysia', 'resep-nasi-lemak-terbaik', 'Sarah Chen', 12, 'recipe', 
 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop',
 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800&h=500&fit=crop',
 'Pelajari cara membuat Nasi Lemak, hidangan nasional Malaysia yang lezat dan autentik.',
 '[{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\"><span class=\"text-4xl font-serif text-primary-500 float-left mr-3 mt-1\">N</span>asi Lemak adalah hidangan nasional Malaysia yang terdiri dari nasi yang dimasak dengan santan, disajikan dengan berbagai lauk pauk seperti ayam goreng, telur, kacang, dan sambal.</p>"},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Berikut adalah resep Nasi Lemak tradisional yang bisa Anda coba di rumah. Resep ini telah diturunkan dari generasi ke generasi dan menghasilkan Nasi Lemak yang autentik dan lezat.</p>"},{"type":"heading","content":"Bahan-Bahan","level":2},{"type":"text","content":"<ul class=\"list-disc pl-6 mb-6 text-lg leading-relaxed\"><li>2 cangkir beras, dicuci dan ditiriskan</li><li>1 cangkir santan kental</li><li>1 cangkir air</li><li>2 lembar daun pandan, diikat</li><li>1 batang serai, dimemarkan</li><li>1 sendok teh garam</li></ul>"},{"type":"image","url":"https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=600&h=400&fit=crop","caption":"Nasi Lemak dengan sambal dan lauk pauk tradisional","alt":"Hidangan Nasi Lemak khas Malaysia"}]',
 150, true, '2023-04-23 11:45:00+00'),
  
(1, '10 Aktivitas Seru di Kelantan - Panduan Lengkap Wisatawan', '10-aktivitas-seru-di-kelantan', 'Ahmad Rahman', 9, 'things-to-do', 
 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=500&fit=crop',
 'Temukan 10 aktivitas seru yang bisa Anda lakukan saat berkunjung ke Kelantan.',
 '[{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\"><span class=\"text-4xl font-serif text-primary-500 float-left mr-3 mt-1\">K</span>elantan adalah destinasi wisata yang menawarkan berbagai aktivitas menarik, mulai dari menjelajahi kota tua hingga menikmati keindahan alam. Berikut adalah 10 aktivitas seru yang bisa Anda lakukan di Kelantan.</p>"},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Panduan ini cocok untuk wisatawan yang baru pertama kali mengunjungi Kelantan maupun yang sudah pernah berkunjung sebelumnya. Setiap aktivitas menawarkan pengalaman unik yang akan membuat liburan Anda di Kelantan menjadi tak terlupakan.</p>"},{"type":"heading","content":"1. Menjelajahi Kota Tua Georgetown","level":2},{"type":"text","content":"<p class=\"mb-6 text-lg leading-relaxed\">Georgetown adalah kota tua yang kaya akan sejarah dan budaya. Anda bisa menjelajahi kota ini dengan berjalan kaki atau bersepeda, mengunjungi berbagai bangunan bersejarah, kuil, dan masjid yang tersebar di seluruh kota.</p>"},{"type":"image","url":"https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=600&h=400&fit=crop","caption":"Pemandangan kota tua Georgetown","alt":"Suasana kota tua Georgetown di Kelantan"}]',
 110, true, '2023-04-22 14:20:00+00');
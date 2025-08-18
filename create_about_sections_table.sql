-- Create about_sections table untuk konten dinamis di setiap halaman kategori
CREATE TABLE IF NOT EXISTS about_sections (
  id SERIAL PRIMARY KEY,
  website_id INTEGER NOT NULL REFERENCES websites(id) ON DELETE CASCADE,
  category VARCHAR(50) NOT NULL UNIQUE, -- food, cafe, events, recipe, things-to-do
  content JSONB NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default data untuk setiap kategori
INSERT INTO about_sections (website_id, category, content) VALUES
(1, 'food', '{
  "title": "Tentang Kuliner Kelantan",
  "description": "Kelantan dikenal sebagai Pearl of the Orient dan merupakan surga kuliner Malaysia. Makanan di sini adalah perpaduan sempurna dari budaya Melayu, Cina, India, dan Peranakan.\n\nDari street food legendaris hingga restoran fine dining, setiap hidangan memiliki cerita dan cita rasa yang unik yang mencerminkan keragaman budaya Kelantan.",
  "tips_title": "🍽️ Tips Makan",
  "tips_description": "Coba makanan di pagi hari untuk mendapatkan rasa terbaik. Street food di Kelantan biasanya lebih segar dan lezat di pagi hari."
}'),

(1, 'cafe', '{
  "title": "Tentang Cafe Kelantan",
  "description": "Kelantan tidak hanya terkenal dengan makanan tradisional, tetapi juga memiliki scene cafe yang berkembang pesat. Cafe-cafe di sini menawarkan perpaduan unik antara kopi modern dan suasana tradisional Melayu.\n\nDari kopi lokal hingga pastry fusion, setiap cafe memiliki karakteristik tersendiri yang mencerminkan kreativitas dan inovasi kuliner Kelantan.",
  "tips_title": "☕ Tips Cafe",
  "tips_description": "Kunjungi cafe di pagi hari untuk mendapatkan suasana yang lebih tenang dan kopi yang baru diseduh. Jangan lupa coba kopi lokal Kelantan!"
}'),

(1, 'events', '{
  "title": "Tentang Event Kuliner Kelantan",
  "description": "Kelantan adalah pusat berbagai event kuliner yang menarik sepanjang tahun. Dari festival makanan tradisional hingga kompetisi memasak, setiap event menampilkan kekayaan kuliner dan budaya Kelantan.\n\nEvent-event ini tidak hanya menghibur, tetapi juga menjadi platform untuk melestarikan dan memperkenalkan kuliner Kelantan ke dunia.",
  "tips_title": "🎉 Tips Event",
  "tips_description": "Pantau kalender event kuliner Kelantan dan daftar lebih awal untuk mendapatkan harga terbaik. Bawa kamera untuk mengabadikan momen spesial!"
}'),

(1, 'recipe', '{
  "title": "Tentang Resep Kelantan",
  "description": "Resep-resep Kelantan adalah warisan berharga yang diturunkan dari generasi ke generasi. Setiap resep memiliki cerita dan teknik memasak yang unik yang mencerminkan keahlian dan kreativitas koki Kelantan.\n\nDari masakan sederhana hingga hidangan mewah, setiap resep menawarkan cita rasa autentik yang sulit ditemukan di tempat lain.",
  "tips_title": "👨‍🍳 Tips Memasak",
  "tips_description": "Gunakan bahan-bahan segar dan rempah-rempah asli Kelantan untuk mendapatkan rasa autentik. Jangan ragu untuk menyesuaikan bumbu sesuai selera!"
}'),

(1, 'things-to-do', '{
  "title": "Tentang Aktivitas Kuliner Kelantan",
  "description": "Kelantan menawarkan berbagai aktivitas kuliner yang menarik untuk semua usia. Dari cooking class tradisional hingga food tour, setiap aktivitas memberikan pengalaman unik untuk memahami dan menikmati kuliner Kelantan.\n\nAktivitas-aktivitas ini tidak hanya menghibur, tetapi juga edukatif dan membantu melestarikan budaya kuliner Kelantan.",
  "tips_title": "🎯 Tips Aktivitas",
  "tips_description": "Pilih aktivitas yang sesuai dengan minat dan waktu Anda. Booking lebih awal untuk aktivitas populer dan siapkan pakaian yang nyaman!"
}');

-- Enable Row Level Security (RLS)
ALTER TABLE about_sections ENABLE ROW LEVEL SECURITY;

-- Create policies untuk read access (public)
CREATE POLICY "Allow public read access to about_sections" ON about_sections FOR SELECT USING (true);

-- Create trigger untuk update timestamp
CREATE TRIGGER update_about_sections_updated_at 
  BEFORE UPDATE ON about_sections 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();

-- Create index untuk performa query
CREATE INDEX idx_about_sections_website_category ON about_sections(website_id, category);
CREATE INDEX idx_about_sections_category ON about_sections(category);
CREATE INDEX idx_about_sections_active ON about_sections(is_active);

-- Comment untuk dokumentasi
COMMENT ON TABLE about_sections IS 'Tabel untuk konten dinamis section "Tentang Kuliner Kelantan" di setiap halaman kategori';
COMMENT ON COLUMN about_sections.category IS 'Kategori halaman: food, cafe, events, recipe, things-to-do';
COMMENT ON COLUMN about_sections.content IS 'JSON berisi title, description, tips_title, dan tips_description';
COMMENT ON COLUMN about_sections.is_active IS 'Status aktif/nonaktif section';

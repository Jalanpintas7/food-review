-- Database Schema untuk Kelantan Food Review
-- Supabase SQL untuk halaman About dan konten dinamis

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Table: about_content (Konten utama halaman about)
CREATE TABLE about_content (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  section_name VARCHAR(100) NOT NULL UNIQUE,
  title VARCHAR(255),
  subtitle VARCHAR(500),
  content TEXT,
  image_url VARCHAR(500),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: mission_vision (Misi dan Visi)
CREATE TABLE mission_vision (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  type VARCHAR(20) NOT NULL CHECK (type IN ('mission', 'vision')),
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  icon_name VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: values (Nilai-nilai perusahaan)
CREATE TABLE company_values (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  icon_name VARCHAR(100),
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: team_members (Anggota tim)
CREATE TABLE team_members (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(255) NOT NULL,
  position VARCHAR(255) NOT NULL,
  bio TEXT,
  image_url VARCHAR(500),
  social_media JSONB,
  order_index INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: key_stats (Statistik utama)
CREATE TABLE key_stats (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(255) NOT NULL,
  value VARCHAR(100) NOT NULL,
  unit VARCHAR(50),
  icon_name VARCHAR(100),
  order_index INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table: page_settings (Pengaturan halaman)
CREATE TABLE page_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  page_name VARCHAR(100) NOT NULL UNIQUE,
  settings JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert sample data untuk about_content
INSERT INTO about_content (section_name, title, subtitle, content, image_url) VALUES
('hero', 'Tentang Kami', 'Kelantan Foodie is founded in April 2016. We want to be best food review and editorial publishing site in Kelantan. A food site in Kelantan that covers food review, the new cafe in Kelantan and trending food editorials. We are a group of Kelantanites, that love Kelantan so much, especially Kelantan FOOD. And so, we set our own quest to share our little footage in discovering and exploring foods in Kelantan. It''s no secret that Kelantan – being a small island it is – is known as food heaven. But where do you find the best and the most try-worthy Kelantan food? Fret not, we got you covered!', NULL, NULL),
('story', 'Cerita Kami', NULL, 'Kelantan Food Review lahir dari kecintaan kami terhadap kuliner Malaysia, khususnya hidangan-hidangan lezat yang ada di Kelantan. Sejak 2020, kami telah berkomitmen untuk memberikan review yang jujur, informatif, dan membantu bagi para pecinta makanan.\n\nTim kami terdiri dari food blogger berpengalaman, chef lokal, dan pecinta kuliner yang memiliki passion untuk mengeksplorasi setiap sudut kuliner Kelantan. Kami percaya bahwa setiap hidangan memiliki cerita unik yang layak untuk dibagikan.\n\nDari warung kaki lima hingga restoran mewah, dari resep tradisional hingga inovasi modern, kami hadir untuk menjadi panduan terpercaya Anda dalam menjelajahi dunia kuliner Kelantan.', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop'),
('team_intro', 'Tim Kami', 'Tim kami terdiri dari food blogger berpengalaman, chef lokal, dan pecinta kuliner yang berdedikasi untuk memberikan konten berkualitas tinggi', NULL, NULL),
('stats_intro', 'Key Stats', 'Pencapaian Kami dalam Angka', NULL, NULL);

-- Insert sample data untuk mission_vision
INSERT INTO mission_vision (type, title, content, icon_name) VALUES
('mission', 'Misi Kami', 'Menjadi platform terpercaya yang menghubungkan pecinta kuliner dengan pengalaman makan terbaik di Kelantan, sambil melestarikan dan mempromosikan kekayaan kuliner Malaysia.', 'check-circle'),
('vision', 'Visi Kami', 'Menjadi komunitas kuliner terbesar di Malaysia yang menginspirasi dan memberdayakan setiap orang untuk mengeksplorasi, mencoba, dan mencintai kuliner lokal.', 'eye');

-- Insert sample data untuk company_values
INSERT INTO company_values (title, description, icon_name, order_index) VALUES
('Passion', 'Kecintaan mendalam terhadap kuliner yang mendorong kami untuk terus mengeksplorasi dan berbagi', 'heart', 1),
('Integritas', 'Review yang jujur dan objektif berdasarkan pengalaman nyata tanpa bias', 'shield-check', 2),
('Komunitas', 'Membangun komunitas pecinta kuliner yang saling mendukung dan berbagi', 'users', 3);

-- Insert sample data untuk team_members
INSERT INTO team_members (name, position, bio, image_url, social_media, order_index) VALUES
('Sarah Chen', 'Founder & Food Blogger', 'Pendiri Kelantan Food Review dengan pengalaman 8 tahun di dunia food blogging', 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=200&h=200&fit=crop&crop=face', '{"instagram": "@sarahchen", "facebook": "sarah.chen.foodie"}', 1),
('Ahmad Rahman', 'Chef & Culinary Expert', 'Chef profesional dengan spesialisasi masakan Melayu dan fusion', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop&crop=face', '{"instagram": "@chefahmad", "facebook": "ahmad.rahman.chef"}', 2),
('Lisa Wong', 'Content Creator', 'Content creator kreatif yang fokus pada visual storytelling', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop&crop=face', '{"instagram": "@lisawong", "facebook": "lisa.wong.content"}', 3);

-- Insert sample data untuk key_stats
INSERT INTO key_stats (title, value, unit, icon_name, order_index) VALUES
('Facebook Monthly Reach', '35M+', 'JUTAAN REACH', 'facebook', 1),
('Facebook Video Views', '20M+', 'JUTAAN VIEWS', 'youtube', 2),
('Facebook Followers', '1M+', 'FOLLOWERS', 'facebook', 3),
('Website Traffic', '2M+', 'MONTHLY VISITORS', 'globe', 4),
('Instagram Followers', '319K+', 'FOLLOWERS', 'instagram', 5);

-- Insert sample data untuk page_settings
INSERT INTO page_settings (page_name, settings) VALUES
('about', '{"last_updated": "2020-07-25", "theme": "red-orange", "show_stats": true, "show_team": true}');

-- Create indexes untuk performa
CREATE INDEX idx_about_content_section ON about_content(section_name);
CREATE INDEX idx_mission_vision_type ON mission_vision(type);
CREATE INDEX idx_company_values_order ON company_values(order_index);
CREATE INDEX idx_team_members_active ON team_members(is_active, order_index);
CREATE INDEX idx_key_stats_active ON key_stats(is_active, order_index);

-- Enable Row Level Security (RLS)
ALTER TABLE about_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE mission_vision ENABLE ROW LEVEL SECURITY;
ALTER TABLE company_values ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE key_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE page_settings ENABLE ROW LEVEL SECURITY;

-- Create policies untuk read access (public)
CREATE POLICY "Allow public read access to about_content" ON about_content FOR SELECT USING (true);
CREATE POLICY "Allow public read access to mission_vision" ON mission_vision FOR SELECT USING (true);
CREATE POLICY "Allow public read access to company_values" ON company_values FOR SELECT USING (true);
CREATE POLICY "Allow public read access to team_members" ON team_members FOR SELECT USING (is_active = true);
CREATE POLICY "Allow public read access to key_stats" ON key_stats FOR SELECT USING (is_active = true);
CREATE POLICY "Allow public read access to page_settings" ON page_settings FOR SELECT USING (true);

-- Create function untuk update timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers untuk auto-update timestamp
CREATE TRIGGER update_about_content_updated_at BEFORE UPDATE ON about_content FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_mission_vision_updated_at BEFORE UPDATE ON mission_vision FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_company_values_updated_at BEFORE UPDATE ON company_values FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_team_members_updated_at BEFORE UPDATE ON team_members FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_key_stats_updated_at BEFORE UPDATE ON key_stats FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_page_settings_updated_at BEFORE UPDATE ON page_settings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

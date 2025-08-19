-- Migration untuk membuat tabel websites
-- Jalankan di Supabase SQL Editor

-- 1. Buat tabel websites
CREATE TABLE IF NOT EXISTS websites (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  logo_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Buat tabel articles jika belum ada
CREATE TABLE IF NOT EXISTS articles (
  id SERIAL PRIMARY KEY,
  website_id INTEGER REFERENCES websites(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  slug TEXT NOT NULL,
  content TEXT,
  summary TEXT,
  author TEXT,
  category TEXT CHECK (category IN ('food', 'cafe', 'events', 'recipe', 'things-to-do')),
  thumbnail_image TEXT,
  minute_read INTEGER DEFAULT 1,
  is_published BOOLEAN DEFAULT false,
  published_at TIMESTAMP WITH TIME ZONE,
  visit_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(website_id, slug)
);

-- 3. Buat tabel contact jika belum ada
CREATE TABLE IF NOT EXISTS contact (
  id SERIAL PRIMARY KEY,
  website_id INTEGER REFERENCES websites(id) ON DELETE CASCADE,
  page_title TEXT DEFAULT 'Contact Us',
  page_description TEXT,
  contact_info JSONB,
  social_media JSONB,
  faq JSONB,
  map JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Insert data website default
INSERT INTO websites (id, name, slug, description) 
VALUES (1, 'Kelantan Food Review', 'kelantan-food-review', 'Platform review makanan dan tempat makan di Kelantan')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  description = EXCLUDED.description;

-- 5. Buat index untuk performa
CREATE INDEX IF NOT EXISTS idx_articles_website_id ON articles(website_id);
CREATE INDEX IF NOT EXISTS idx_articles_category ON articles(category);
CREATE INDEX IF NOT EXISTS idx_articles_published ON articles(is_published, published_at);
CREATE INDEX IF NOT EXISTS idx_articles_slug ON articles(website_id, slug);

-- 6. Buat RLS policies (Row Level Security)
ALTER TABLE websites ENABLE ROW LEVEL SECURITY;
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact ENABLE ROW LEVEL SECURITY;

-- Policy untuk websites (read-only untuk semua)
CREATE POLICY "websites_read_policy" ON websites
  FOR SELECT USING (true);

-- Policy untuk articles (read-only untuk semua)
CREATE POLICY "articles_read_policy" ON articles
  FOR SELECT USING (true);

-- Policy untuk contact (read-only untuk semua)
CREATE POLICY "contact_read_policy" ON contact
  FOR SELECT USING (true);

-- 7. Buat trigger untuk update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_websites_updated_at BEFORE UPDATE ON websites
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_articles_updated_at BEFORE UPDATE ON articles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_contact_updated_at BEFORE UPDATE ON contact
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();



-- Update tabel articles untuk menambahkan sistem tag dan label
-- Tambahkan kolom tags dan labels ke tabel articles yang sudah ada

-- 1. Tambahkan kolom tags dan labels ke tabel articles
ALTER TABLE public.articles 
ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}',
ADD COLUMN IF NOT EXISTS labels TEXT[] DEFAULT '{}';

-- 2. Buat tabel tags untuk manajemen tag yang lebih baik
CREATE TABLE IF NOT EXISTS public.tags (
  id SERIAL PRIMARY KEY,
  website_id INTEGER NOT NULL REFERENCES websites(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL,
  color VARCHAR(7) DEFAULT '#3B82F6', -- Hex color untuk tag
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(website_id, slug)
);

-- 3. Buat tabel labels untuk manajemen label yang lebih baik
CREATE TABLE IF NOT EXISTS public.labels (
  id SERIAL PRIMARY KEY,
  website_id INTEGER NOT NULL REFERENCES websites(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL,
  color VARCHAR(7) DEFAULT '#EF4444', -- Hex color untuk label
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(website_id, slug)
);

-- 4. Buat tabel junction untuk relasi many-to-many antara articles dan tags
CREATE TABLE IF NOT EXISTS public.article_tags (
  id SERIAL PRIMARY KEY,
  article_id UUID NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(article_id, tag_id)
);

-- 5. Buat tabel junction untuk relasi many-to-many antara articles dan labels
CREATE TABLE IF NOT EXISTS public.article_labels (
  id SERIAL PRIMARY KEY,
  article_id UUID NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
  label_id INTEGER NOT NULL REFERENCES labels(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(article_id, label_id)
);

-- 6. Insert default tags untuk website
INSERT INTO public.tags (website_id, name, slug, color, description) VALUES
(1, 'Makanan Tradisional', 'makanan-tradisional', '#DC2626', 'Makanan khas tradisional Kelantan'),
(1, 'Street Food', 'street-food', '#EA580C', 'Makanan jalanan dan warung kaki lima'),
(1, 'Fine Dining', 'fine-dining', '#7C3AED', 'Restoran mewah dan fine dining'),
(1, 'Seafood', 'seafood', '#0891B2', 'Makanan laut dan ikan segar'),
(1, 'Halal', 'halal', '#059669', 'Makanan halal dan bersertifikat'),
(1, 'Vegetarian', 'vegetarian', '#16A34A', 'Makanan vegetarian dan vegan'),
(1, 'Dessert', 'dessert', '#E11D48', 'Makanan manis dan pencuci mulut'),
(1, 'Beverage', 'beverage', '#9333EA', 'Minuman dan jus'),
(1, 'Local Favorites', 'local-favorites', '#CA8A04', 'Favorit warga lokal'),
(1, 'Must Try', 'must-try', '#DC2626', 'Wajib dicoba saat ke Kelantan')
ON CONFLICT (website_id, slug) DO NOTHING;

-- 7. Insert default labels untuk website
INSERT INTO public.labels (website_id, name, slug, color, description) VALUES
(1, '🔥 Hot', 'hot', '#DC2626', 'Artikel yang sedang trending'),
(1, '⭐ Recommended', 'recommended', '#F59E0B', 'Artikel yang direkomendasikan'),
(1, '🆕 New', 'new', '#10B981', 'Artikel terbaru'),
(1, '🏆 Best', 'best', '#8B5CF6', 'Artikel terbaik'),
(1, '💡 Tips', 'tips', '#3B82F6', 'Artikel berisi tips dan trik'),
(1, '📸 Photo Story', 'photo-story', '#EC4899', 'Artikel dengan foto-foto menarik'),
(1, '🎯 Featured', 'featured', '#EF4444', 'Artikel unggulan'),
(1, '📖 Guide', 'guide', '#06B6D4', 'Artikel panduan lengkap'),
(1, '🌟 Editor Choice', 'editor-choice', '#F59E0B', 'Pilihan editor'),
(1, '💎 Premium', 'premium', '#8B5CF6', 'Konten premium eksklusif')
ON CONFLICT (website_id, slug) DO NOTHING;

-- 8. Update beberapa artikel yang sudah ada dengan tags dan labels
UPDATE public.articles 
SET 
  tags = ARRAY['makanan-tradisional', 'local-favorites'],
  labels = ARRAY['🔥 Hot', '⭐ Recommended']
WHERE category = 'food' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['street-food', 'must-try'],
  labels = ARRAY['🆕 New', '💡 Tips']
WHERE category = 'food' 
LIMIT 5;

-- 9. Enable Row Level Security (RLS)
ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE labels ENABLE ROW LEVEL SECURITY;
ALTER TABLE article_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE article_labels ENABLE ROW LEVEL SECURITY;

-- 10. Create policies untuk read access (public)
CREATE POLICY "Allow public read access to tags" ON tags FOR SELECT USING (true);
CREATE POLICY "Allow public read access to labels" ON labels FOR SELECT USING (true);
CREATE POLICY "Allow public read access to article_tags" ON article_tags FOR SELECT USING (true);
CREATE POLICY "Allow public read access to article_labels" ON article_labels FOR SELECT USING (true);

-- 11. Create trigger untuk update timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_tags_updated_at 
  BEFORE UPDATE ON tags 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_labels_updated_at 
  BEFORE UPDATE ON labels 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();

-- 12. Create index untuk performa query
CREATE INDEX idx_articles_tags ON articles USING GIN(tags);
CREATE INDEX idx_articles_labels ON articles USING GIN(labels);
CREATE INDEX idx_tags_website_slug ON tags(website_id, slug);
CREATE INDEX idx_labels_website_slug ON labels(website_id, slug);
CREATE INDEX idx_article_tags_article ON article_tags(article_id);
CREATE INDEX idx_article_tags_tag ON article_tags(tag_id);
CREATE INDEX idx_article_labels_article ON article_labels(article_id);
CREATE INDEX idx_article_labels_label ON article_labels(label_id);

-- 13. Comment untuk dokumentasi
COMMENT ON COLUMN articles.tags IS 'Array berisi nama tag untuk artikel (contoh: ["makanan-tradisional", "local-favorites"])';
COMMENT ON COLUMN articles.labels IS 'Array berisi nama label untuk artikel (contoh: ["🔥 Hot", "⭐ Recommended"])';
COMMENT ON TABLE tags IS 'Tabel untuk manajemen tag artikel dengan warna dan deskripsi';
COMMENT ON TABLE labels IS 'Tabel untuk manajemen label artikel dengan warna dan deskripsi';
COMMENT ON TABLE article_tags IS 'Tabel junction untuk relasi many-to-many antara articles dan tags';
COMMENT ON TABLE article_labels IS 'Tabel junction untuk relasi many-to-many antara articles dan labels';

-- 14. View untuk memudahkan query artikel dengan tags dan labels
CREATE OR REPLACE VIEW articles_with_tags_labels AS
SELECT 
  a.*,
  array_agg(DISTINCT t.name) FILTER (WHERE t.name IS NOT NULL) as tag_names,
  array_agg(DISTINCT l.name) FILTER (WHERE l.name IS NOT NULL) as label_names,
  array_agg(DISTINCT t.color) FILTER (WHERE t.color IS NOT NULL) as tag_colors,
  array_agg(DISTINCT l.color) FILTER (WHERE l.color IS NOT NULL) as label_colors
FROM articles a
LEFT JOIN article_tags at ON a.id = at.article_id
LEFT JOIN tags t ON at.tag_id = t.id AND t.is_active = true
LEFT JOIN article_labels al ON a.id = al.article_id
LEFT JOIN labels l ON al.label_id = l.id AND l.is_active = true
WHERE a.is_published = true
GROUP BY a.id;

-- 15. Function untuk mendapatkan artikel berdasarkan tag
CREATE OR REPLACE FUNCTION get_articles_by_tag(website_id_param INTEGER, tag_slug_param VARCHAR)
RETURNS TABLE (
  id UUID,
  title VARCHAR(255),
  slug VARCHAR(255),
  summary TEXT,
  thumbnail_image VARCHAR(500),
  category VARCHAR(50),
  published_at TIMESTAMP WITH TIME ZONE,
  tag_names TEXT[]
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    a.id,
    a.title,
    a.slug,
    a.summary,
    a.thumbnail_image,
    a.category,
    a.published_at,
    array_agg(DISTINCT t.name) as tag_names
  FROM articles a
  JOIN article_tags at ON a.id = at.article_id
  JOIN tags t ON at.tag_id = t.id
  WHERE a.website_id = website_id_param 
    AND t.slug = tag_slug_param 
    AND a.is_published = true
    AND t.is_active = true
  GROUP BY a.id, a.title, a.slug, a.summary, a.thumbnail_image, a.category, a.published_at
  ORDER BY a.published_at DESC;
END;
$$ LANGUAGE plpgsql;

-- 16. Function untuk mendapatkan artikel berdasarkan label
CREATE OR REPLACE FUNCTION get_articles_by_label(website_id_param INTEGER, label_slug_param VARCHAR)
RETURNS TABLE (
  id UUID,
  title VARCHAR(255),
  slug VARCHAR(255),
  summary TEXT,
  thumbnail_image VARCHAR(500),
  category VARCHAR(50),
  published_at TIMESTAMP WITH TIME ZONE,
  label_names TEXT[]
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    a.id,
    a.title,
    a.slug,
    a.summary,
    a.thumbnail_image,
    a.category,
    a.published_at,
    array_agg(DISTINCT l.name) as label_names
  FROM articles a
  JOIN article_labels al ON a.id = al.article_id
  JOIN labels l ON al.label_id = l.id
  WHERE a.website_id = website_id_param 
    AND l.slug = label_slug_param 
    AND a.is_published = true
    AND l.is_active = true
  GROUP BY a.id, a.title, a.slug, a.summary, a.thumbnail_image, a.category, a.published_at
  ORDER BY a.published_at DESC;
END;
$$ LANGUAGE plpgsql;

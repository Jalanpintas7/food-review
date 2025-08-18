-- Cleanup Database Structure untuk Tags dan Labels
-- Pastikan struktur tabel articles sesuai dengan yang diinginkan

-- 1. Hapus tabel junction yang tidak diperlukan
DROP TABLE IF EXISTS public.article_labels CASCADE;
DROP TABLE IF EXISTS public.article_tags CASCADE;

-- 2. Hapus tabel tags dan labels yang tidak diperlukan
DROP TABLE IF EXISTS public.tags CASCADE;
DROP TABLE IF EXISTS public.labels CASCADE;

-- 3. Pastikan kolom tags dan labels ada di tabel articles dengan struktur yang benar
ALTER TABLE public.articles 
ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}'::text[],
ADD COLUMN IF NOT EXISTS labels TEXT[] DEFAULT '{}'::text[];

-- 4. Buat index untuk kolom array (untuk performa)
CREATE INDEX IF NOT EXISTS idx_articles_tags ON public.articles USING GIN (tags) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS idx_articles_labels ON public.articles USING GIN (labels) TABLESPACE pg_default;

-- 5. Update beberapa artikel dengan sample tags dan labels
UPDATE public.articles 
SET 
  tags = ARRAY['Makanan Tradisional', 'Local Favorites'],
  labels = ARRAY['🔥 Hot', '⭐ Recommended']
WHERE category = 'food' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['Street Food', 'Must Try'],
  labels = ARRAY['🆕 New', '💡 Tips']
WHERE category = 'food' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['Fine Dining', 'Seafood'],
  labels = ARRAY['🏆 Best', '🌟 Editor Choice']
WHERE category = 'cafe' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['Event Planning', 'Cultural'],
  labels = ARRAY['🎯 Featured', '📖 Guide']
WHERE category = 'events' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['Traditional Recipe', 'Cooking Tips'],
  labels = ARRAY['💡 Tips', '📸 Photo Story']
WHERE category = 'recipe' 
LIMIT 5;

UPDATE public.articles 
SET 
  tags = ARRAY['Adventure', 'Local Experience'],
  labels = ARRAY['🆕 New', '💎 Premium']
WHERE category = 'things-to-do' 
LIMIT 5;

-- 6. Verifikasi struktur
SELECT 
  column_name, 
  data_type, 
  is_nullable, 
  column_default
FROM information_schema.columns 
WHERE table_name = 'articles' 
  AND column_name IN ('tags', 'labels')
ORDER BY column_name;

-- 7. Tampilkan sample data
SELECT 
  id, 
  title, 
  category, 
  tags, 
  labels
FROM public.articles 
WHERE tags IS NOT NULL 
  OR labels IS NOT NULL
LIMIT 10;

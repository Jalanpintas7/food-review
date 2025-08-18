-- Insert 30 data dummy artikel dengan tags dan labels yang bervariasi
-- Pastikan tabel articles, tags, dan labels sudah dibuat terlebih dahulu

-- Insert dummy articles
INSERT INTO public.articles (
  website_id, 
  title, 
  slug, 
  author, 
  minute_read, 
  category, 
  thumbnail_image, 
  summary, 
  content, 
  is_published, 
  published_at,
  tags,
  labels
) VALUES
-- Food Category (10 articles)
(1, 'Nasi Kerabu: Kuliner Tradisional Kelantan yang Wajib Dicoba', 'nasi-kerabu-kelantan', 'Chef Ahmad', 8, 'food', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600&h=400&fit=crop', 'Nasi Kerabu adalah hidangan tradisional Kelantan yang terkenal dengan warna biru alami dan cita rasa yang unik. Artikel ini akan membahas sejarah, cara pembuatan, dan tempat terbaik untuk menikmatinya.', '{"content": "Artikel lengkap tentang Nasi Kerabu Kelantan..."}', true, NOW() - INTERVAL '1 day', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['🔥 Hot', '⭐ Recommended']),

(1, 'Ayam Percik: Kelezatan Ayam Panggang dengan Bumbu Khas', 'ayam-percik-kelantan', 'Chef Siti', 6, 'food', 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=600&h=400&fit=crop', 'Ayam Percik adalah hidangan ayam panggang dengan bumbu khas Kelantan yang memberikan cita rasa pedas dan gurih yang tak terlupakan.', '{"content": "Artikel lengkap tentang Ayam Percik..."}', true, NOW() - INTERVAL '2 days', ARRAY['makanan-tradisional', 'must-try'], ARRAY['🆕 New', '💡 Tips']),

(1, 'Laksa Kelantan: Perbedaan dengan Laksa Lain dan Resep Rahasia', 'laksa-kelantan-resep-rahasia', 'Chef Rahman', 10, 'food', 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=600&h=400&fit=crop', 'Laksa Kelantan memiliki karakteristik unik yang membedakannya dari laksa daerah lain. Artikel ini akan membahas resep rahasia dan cara pembuatan yang benar.', '{"content": "Artikel lengkap tentang Laksa Kelantan..."}', true, NOW() - INTERVAL '3 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['🏆 Best', '📖 Guide']),

(1, 'Street Food Kelantan: 15 Makanan Jalanan yang Wajib Dicoba', 'street-food-kelantan-15-makanan', 'Food Blogger Maya', 12, 'food', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Jelajahi 15 street food terbaik di Kelantan yang memberikan pengalaman kuliner autentik dan cita rasa lokal yang tak terlupakan.', '{"content": "Artikel lengkap tentang Street Food Kelantan..."}', true, NOW() - INTERVAL '4 days', ARRAY['street-food', 'must-try'], ARRAY['🔥 Hot', '📸 Photo Story']),

(1, 'Ikan Bakar Kelantan: Teknik Memasak dan Bumbu Rahasia', 'ikan-bakar-kelantan-teknik-bumbu', 'Chef Ismail', 8, 'food', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=600&h=400&fit=crop', 'Ikan bakar adalah hidangan favorit di Kelantan. Artikel ini akan membahas teknik memasak yang benar dan bumbu rahasia yang membuatnya istimewa.', '{"content": "Artikel lengkap tentang Ikan Bakar Kelantan..."}', true, NOW() - INTERVAL '5 days', ARRAY['seafood', 'makanan-tradisional'], ARRAY['💡 Tips', '📖 Guide']),

(1, 'Kuih Tradisional Kelantan: 10 Jenis Kuih yang Harus Dicoba', 'kuih-tradisional-kelantan-10-jenis', 'Chef Fatimah', 7, 'food', 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=600&h=400&fit=crop', 'Kuih tradisional Kelantan memiliki cita rasa manis yang unik. Artikel ini akan memperkenalkan 10 jenis kuih terbaik yang wajib dicoba.', '{"content": "Artikel lengkap tentang Kuih Tradisional Kelantan..."}', true, NOW() - INTERVAL '6 days', ARRAY['dessert', 'makanan-tradisional'], ARRAY['⭐ Recommended', '🌟 Editor Choice']),

(1, 'Teh Tarik Kelantan: Seni Membuat Teh Tarik yang Sempurna', 'teh-tarik-kelantan-seni-membuat', 'Barista Ali', 5, 'food', 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=600&h=400&fit=crop', 'Teh tarik adalah minuman khas yang tak terpisahkan dari budaya Kelantan. Artikel ini akan membahas seni membuat teh tarik yang sempurna.', '{"content": "Artikel lengkap tentang Teh Tarik Kelantan..."}', true, NOW() - INTERVAL '7 days', ARRAY['beverage', 'local-favorites'], ARRAY['💡 Tips', '📸 Photo Story']),

(1, 'Nasi Dagang: Sarapan Tradisional Kelantan yang Mengenyangkan', 'nasi-dagang-sarapan-tradisional', 'Chef Zainab', 6, 'food', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600&h=400&fit=crop', 'Nasi Dagang adalah sarapan tradisional Kelantan yang terkenal dengan cita rasa gurih dan mengenyangkan. Artikel ini akan membahas cara pembuatan dan variasi bumbunya.', '{"content": "Artikel lengkap tentang Nasi Dagang..."}', true, NOW() - INTERVAL '8 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['🆕 New', '💡 Tips']),

(1, 'Gulai Nangka: Sayuran Tradisional dengan Cita Rasa Khas', 'gulai-nangka-sayuran-tradisional', 'Chef Aminah', 7, 'food', 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&h=400&fit=crop', 'Gulai Nangka adalah hidangan sayuran tradisional Kelantan yang kaya akan rempah dan cita rasa. Artikel ini akan membahas resep dan cara pembuatan yang benar.', '{"content": "Artikel lengkap tentang Gulai Nangka..."}', true, NOW() - INTERVAL '9 days', ARRAY['vegetarian', 'makanan-tradisional'], ARRAY['📖 Guide', '💎 Premium']),

(1, 'Keropok Lekor: Snack Tradisional Kelantan yang Crispy', 'keropok-lekor-snack-tradisional', 'Chef Yusuf', 5, 'food', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=600&h=400&fit=crop', 'Keropok Lekor adalah snack tradisional Kelantan yang terkenal dengan tekstur crispy dan cita rasa gurih. Artikel ini akan membahas cara pembuatan dan tips penyimpanan.', '{"content": "Artikel lengkap tentang Keropok Lekor..."}', true, NOW() - INTERVAL '10 days', ARRAY['street-food', 'local-favorites'], ARRAY['🔥 Hot', '💡 Tips']),

-- Cafe Category (8 articles)
(1, 'Cafe Modern di Kota Bharu: 8 Tempat Instagramable untuk Nongkrong', 'cafe-modern-kota-bharu-8-tempat', 'Cafe Hunter Sarah', 10, 'cafe', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop', 'Jelajahi 8 cafe modern di Kota Bharu yang tidak hanya menyajikan kopi berkualitas tetapi juga memiliki desain interior yang Instagramable.', '{"content": "Artikel lengkap tentang Cafe Modern di Kota Bharu..."}', true, NOW() - INTERVAL '11 days', ARRAY['fine-dining', 'local-favorites'], ARRAY['📸 Photo Story', '🎯 Featured']),

(1, 'Kopi Lokal Kelantan: Dari Biji hingga Secangkir Sempurna', 'kopi-lokal-kelantan-biji-secangkir', 'Barista Master', 8, 'cafe', 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600&h=400&fit=crop', 'Kopi lokal Kelantan memiliki karakteristik unik yang membedakannya dari kopi daerah lain. Artikel ini akan membahas proses dari biji hingga secangkir kopi yang sempurna.', '{"content": "Artikel lengkap tentang Kopi Lokal Kelantan..."}', true, NOW() - INTERVAL '12 days', ARRAY['beverage', 'local-favorites'], ARRAY['💡 Tips', '📖 Guide']),

(1, 'Teh Tarik Premium: Variasi Teh Tarik Modern di Kelantan', 'teh-tarik-premium-variasi-modern', 'Tea Expert', 6, 'cafe', 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=600&h=400&fit=crop', 'Teh tarik tidak hanya tradisional, kini ada variasi modern yang menarik. Artikel ini akan memperkenalkan teh tarik premium dengan berbagai topping dan varian rasa.', '{"content": "Artikel lengkap tentang Teh Tarik Premium..."}', true, NOW() - INTERVAL '13 days', ARRAY['beverage', 'fine-dining'], ARRAY['🆕 New', '💎 Premium']),

(1, 'Cafe dengan View Terbaik di Kelantan: Nikmati Kopi dengan Pemandangan Indah', 'cafe-view-terbaik-kelantan-pemandangan', 'Travel Blogger', 9, 'cafe', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop', 'Temukan cafe-cafe di Kelantan yang tidak hanya menyajikan kopi berkualitas tetapi juga memiliki view yang memukau untuk dinikmati sambil menyeruput kopi.', '{"content": "Artikel lengkap tentang Cafe dengan View Terbaik..."}', true, NOW() - INTERVAL '14 days', ARRAY['fine-dining', 'local-favorites'], ARRAY['📸 Photo Story', '🌟 Editor Choice']),

(1, 'Pastry dan Dessert di Cafe Kelantan: Dari Tradisional hingga Modern', 'pastry-dessert-cafe-kelantan-tradisional-modern', 'Pastry Chef', 7, 'cafe', 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=600&h=400&fit=crop', 'Cafe di Kelantan tidak hanya terkenal dengan kopinya, tetapi juga dengan pastry dan dessert yang lezat. Artikel ini akan memperkenalkan berbagai pilihan dari tradisional hingga modern.', '{"content": "Artikel lengkap tentang Pastry dan Dessert di Cafe..."}', true, NOW() - INTERVAL '15 days', ARRAY['dessert', 'fine-dining'], ARRAY['💡 Tips', '📖 Guide']),

(1, 'Cafe Halal di Kelantan: Tempat Nongkrong Nyaman untuk Muslim', 'cafe-halal-kelantan-tempat-nongkrong', 'Halal Food Guide', 6, 'cafe', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop', 'Kelantan dikenal dengan komitmennya terhadap makanan halal. Artikel ini akan memperkenalkan cafe-cafe halal yang nyaman untuk dikunjungi.', '{"content": "Artikel lengkap tentang Cafe Halal di Kelantan..."}', true, NOW() - INTERVAL '16 days', ARRAY['halal', 'local-favorites'], ARRAY['⭐ Recommended', '💡 Tips']),

(1, 'Cafe untuk Work From Home di Kelantan: Tempat Produktif dengan WiFi Cepat', 'cafe-work-from-home-kelantan-wifi-cepat', 'Digital Nomad', 8, 'cafe', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop', 'Bagi yang bekerja dari rumah, cafe dengan WiFi cepat dan suasana yang nyaman sangat penting. Artikel ini akan memperkenalkan cafe-cafe yang cocok untuk WFH.', '{"content": "Artikel lengkap tentang Cafe untuk Work From Home..."}', true, NOW() - INTERVAL '17 days', ARRAY['fine-dining', 'local-favorites'], ARRAY['🆕 New', '💡 Tips']),

(1, 'Cafe dengan Live Music di Kelantan: Nikmati Kopi dengan Hiburan', 'cafe-live-music-kelantan-hiburan', 'Music Lover', 7, 'cafe', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&h=400&fit=crop', 'Cafe dengan live music memberikan pengalaman yang berbeda. Artikel ini akan memperkenalkan cafe-cafe di Kelantan yang menyediakan hiburan live music.', '{"content": "Artikel lengkap tentang Cafe dengan Live Music..."}', true, NOW() - INTERVAL '18 days', ARRAY['fine-dining', 'local-favorites'], ARRAY['🎯 Featured', '📸 Photo Story']),

-- Events Category (6 articles)
(1, 'Festival Makanan Kelantan 2024: Acara Kuliner Terbesar di Timur', 'festival-makanan-kelantan-2024', 'Event Organizer', 12, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Festival Makanan Kelantan 2024 adalah acara kuliner terbesar di kawasan timur Malaysia. Artikel ini akan membahas jadwal, peserta, dan highlight acara.', '{"content": "Artikel lengkap tentang Festival Makanan Kelantan 2024..."}', true, NOW() - INTERVAL '19 days', ARRAY['local-favorites', 'must-try'], ARRAY['🔥 Hot', '🎯 Featured']),

(1, 'Kompetisi Memasak Tradisional Kelantan: Melestarikan Warisan Kuliner', 'kompetisi-memasak-tradisional-kelantan', 'Culinary Expert', 10, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Kompetisi memasak tradisional adalah cara untuk melestarikan warisan kuliner Kelantan. Artikel ini akan membahas peserta, juri, dan hidangan yang dinilai.', '{"content": "Artikel lengkap tentang Kompetisi Memasak Tradisional..."}', true, NOW() - INTERVAL '20 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['🏆 Best', '📖 Guide']),

(1, 'Food Tour Kelantan: Jelajahi Kuliner Tradisional dalam 3 Hari', 'food-tour-kelantan-3-hari', 'Travel Guide', 15, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Food tour adalah cara terbaik untuk mengenal kuliner Kelantan. Artikel ini akan memberikan itinerary lengkap untuk food tour 3 hari yang memuaskan.', '{"content": "Artikel lengkap tentang Food Tour Kelantan..."}', true, NOW() - INTERVAL '21 days', ARRAY['local-favorites', 'must-try'], ARRAY['📖 Guide', '🌟 Editor Choice']),

(1, 'Workshop Memasak Masakan Kelantan: Belajar dari Chef Lokal', 'workshop-memasak-masakan-kelantan', 'Cooking Instructor', 8, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Workshop memasak adalah kesempatan untuk belajar langsung dari chef lokal. Artikel ini akan membahas jadwal workshop dan menu yang akan dipelajari.', '{"content": "Artikel lengkap tentang Workshop Memasak..."}', true, NOW() - INTERVAL '22 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['💡 Tips', '📸 Photo Story']),

(1, 'Pameran Kuliner Kelantan: Dari Tradisional hingga Modern', 'pameran-kuliner-kelantan-tradisional-modern', 'Exhibition Curator', 9, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Pameran kuliner adalah platform untuk memperkenalkan kekayaan kuliner Kelantan. Artikel ini akan membahas peserta pameran dan hidangan yang ditampilkan.', '{"content": "Artikel lengkap tentang Pameran Kuliner Kelantan..."}', true, NOW() - INTERVAL '23 days', ARRAY['fine-dining', 'local-favorites'], ARRAY['🆕 New', '📸 Photo Story']),

(1, 'Acara Makan Bersama Keluarga: Tradisi yang Harus Dilestarikan', 'acara-makan-bersama-keluarga-tradisi', 'Family Counselor', 7, 'events', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Makan bersama keluarga adalah tradisi yang harus dilestarikan. Artikel ini akan membahas pentingnya acara makan bersama dan cara mengadakannya.', '{"content": "Artikel lengkap tentang Acara Makan Bersama Keluarga..."}', true, NOW() - INTERVAL '24 days', ARRAY['local-favorites', 'makanan-tradisional'], ARRAY['💡 Tips', '📖 Guide']),

-- Recipe Category (4 articles)
(1, 'Resep Nasi Kerabu Kelantan: Langkah demi Langkah yang Mudah', 'resep-nasi-kerabu-kelantan-langkah-mudah', 'Chef Master', 12, 'recipe', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600&h=400&fit=crop', 'Resep Nasi Kerabu Kelantan yang mudah diikuti dengan langkah demi langkah yang detail. Artikel ini akan membahas bahan, cara pembuatan, dan tips memasak.', '{"content": "Artikel lengkap tentang Resep Nasi Kerabu Kelantan..."}', true, NOW() - INTERVAL '25 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['🏆 Best', '📖 Guide']),

(1, 'Resep Ayam Percik: Bumbu Rahasia yang Membuatnya Istimewa', 'resep-ayam-percik-bumbu-rahasia', 'Chef Traditional', 10, 'recipe', 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=600&h=400&fit=crop', 'Resep Ayam Percik dengan bumbu rahasia yang membuatnya istimewa. Artikel ini akan membahas cara pembuatan dan rahasia bumbu yang lezat.', '{"content": "Artikel lengkap tentang Resep Ayam Percik..."}', true, NOW() - INTERVAL '26 days', ARRAY['makanan-tradisional', 'must-try'], ARRAY['💡 Tips', '🌟 Editor Choice']),

(1, 'Resep Kuih Tradisional Kelantan: 5 Jenis Kuih yang Mudah Dibuat', 'resep-kuih-tradisional-kelantan-5-jenis', 'Pastry Master', 8, 'recipe', 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=600&h=400&fit=crop', 'Resep 5 jenis kuih tradisional Kelantan yang mudah dibuat di rumah. Artikel ini akan membahas bahan, cara pembuatan, dan tips sukses.', '{"content": "Artikel lengkap tentang Resep Kuih Tradisional..."}', true, NOW() - INTERVAL '27 days', ARRAY['dessert', 'makanan-tradisional'], ARRAY['💡 Tips', '📸 Photo Story']),

(1, 'Resep Teh Tarik Kelantan: Teknik Membuat yang Sempurna', 'resep-teh-tarik-kelantan-teknik-sempurna', 'Tea Master', 6, 'recipe', 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=600&h=400&fit=crop', 'Resep Teh Tarik Kelantan dengan teknik membuat yang sempurna. Artikel ini akan membahas cara pembuatan dan tips untuk mendapatkan teh tarik yang lezat.', '{"content": "Artikel lengkap tentang Resep Teh Tarik Kelantan..."}', true, NOW() - INTERVAL '28 days', ARRAY['beverage', 'local-favorites'], ARRAY['💡 Tips', '📖 Guide']),

-- Things-to-do Category (2 articles)
(1, 'Cooking Class Tradisional Kelantan: Belajar Memasak dari Ahlinya', 'cooking-class-tradisional-kelantan', 'Cooking School', 9, 'things-to-do', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Cooking class tradisional adalah cara terbaik untuk belajar memasak masakan Kelantan. Artikel ini akan membahas jadwal, menu, dan pengalaman belajar.', '{"content": "Artikel lengkap tentang Cooking Class Tradisional..."}', true, NOW() - INTERVAL '29 days', ARRAY['makanan-tradisional', 'local-favorites'], ARRAY['📖 Guide', '💎 Premium']),

(1, 'Food Photography Workshop di Kelantan: Abadikan Keindahan Kuliner', 'food-photography-workshop-kelantan', 'Photography Expert', 8, 'things-to-do', 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop', 'Food photography workshop adalah kesempatan untuk belajar mengabadikan keindahan kuliner Kelantan. Artikel ini akan membahas teknik dan tips fotografi makanan.', '{"content": "Artikel lengkap tentang Food Photography Workshop..."}', true, NOW() - INTERVAL '30 days', ARRAY['local-favorites', 'fine-dining'], ARRAY['📸 Photo Story', '💡 Tips']);

-- Update visit_count untuk beberapa artikel agar ada variasi
UPDATE public.articles 
SET visit_count = FLOOR(RANDOM() * 1000) + 100
WHERE id IN (
  SELECT id FROM public.articles ORDER BY RANDOM() LIMIT 15
);

-- Update visit_count untuk artikel yang sudah ada (jika ada)
UPDATE public.articles 
SET visit_count = COALESCE(visit_count, FLOOR(RANDOM() * 500) + 50)
WHERE visit_count IS NULL;

-- Insert data ke junction tables untuk tags dan labels
-- Note: Ini akan otomatis terhubung karena kita sudah menggunakan kolom tags dan labels di tabel articles
-- Jika ingin menggunakan junction tables, bisa uncomment dan sesuaikan dengan ID yang ada

-- Contoh insert ke junction tables (opsional):
-- INSERT INTO public.article_tags (article_id, tag_id) VALUES
-- (SELECT id FROM articles WHERE title LIKE '%Nasi Kerabu%', SELECT id FROM tags WHERE slug = 'makanan-tradisional'),
-- (SELECT id FROM articles WHERE title LIKE '%Nasi Kerabu%', SELECT id FROM tags WHERE slug = 'local-favorites');

-- INSERT INTO public.article_labels (article_id, label_id) VALUES
-- (SELECT id FROM articles WHERE title LIKE '%Nasi Kerabu%', SELECT id FROM labels WHERE slug = 'hot'),
-- (SELECT id FROM articles WHERE title LIKE '%Nasi Kerabu%', SELECT id FROM labels WHERE slug = 'recommended');

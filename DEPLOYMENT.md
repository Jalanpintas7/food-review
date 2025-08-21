# Deployment Guide untuk Netlify

## 🚀 Langkah-langkah Deployment

### 1. Persiapan Repository
- Pastikan semua perubahan sudah di-commit ke Git
- Push ke repository GitHub/GitLab

### 2. Setup di Netlify

1. **Login ke Netlify** dan klik "New site from Git"
2. **Connect repository** yang berisi project ini
3. **Configure build settings**:
   - Build command: `npm run build`
   - Publish directory: `build`
   - Node version: `18`

### 3. Environment Variables

Tambahkan environment variables berikut di Netlify dashboard:

```
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

**Cara mendapatkan Supabase credentials:**
1. Login ke [Supabase Dashboard](https://supabase.com/dashboard)
2. Pilih project Anda
3. Buka Settings > API
4. Copy "Project URL" dan "anon public" key

### 4. Deploy

Klik "Deploy site" dan tunggu proses build selesai.

## 🔧 Troubleshooting

### Build Error
- Pastikan Node.js version 18 digunakan
- Check log build untuk error details
- Pastikan semua dependencies terinstall

### Environment Variables Error
- Pastikan `VITE_SUPABASE_URL` dan `VITE_SUPABASE_ANON_KEY` sudah diset
- Restart deploy setelah menambah environment variables

### Routing Issues
- File `static/_redirects` sudah dibuat untuk SPA routing
- Pastikan tidak ada redirects di `netlify.toml`

## 📝 Notes

- Project menggunakan `@sveltejs/adapter-netlify` untuk optimal deployment
- Build output akan berada di folder `build/`
- Static files (seperti `_redirects`) akan otomatis di-copy ke build output

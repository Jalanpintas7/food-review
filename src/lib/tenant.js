import { supabase } from './supabase';

// Default website untuk Kelantan Food Review
export const DEFAULT_WEBSITE = {
  id: 1,
  name: 'Kelantan Food Review',
  slug: 'kelantan-food-review'
};

/**
 * Mendapatkan informasi website berdasarkan ID
 * @param {number} id - ID website
 * @returns {Promise<Object|null>} - Informasi website atau null jika tidak ditemukan
 */
export async function getWebsiteById(id = DEFAULT_WEBSITE.id) {
  const { data, error } = await supabase
    .from('websites')
    .select('*')
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching website:', error);
    return null;
  }

  return data;
}

/**
 * Mendapatkan informasi website berdasarkan slug
 * @param {string} slug - Slug website dari URL
 * @returns {Promise<Object|null>} - Informasi website atau null jika tidak ditemukan
 */
export async function getWebsiteBySlug(slug) {
  // Jika tidak ada slug, kembalikan website default
  if (!slug) return DEFAULT_WEBSITE;

  const { data, error } = await supabase
    .from('websites')
    .select('*')
    .eq('slug', slug)
    .single();

  if (error) {
    console.error('Error fetching website:', error);
    return DEFAULT_WEBSITE;
  }

  return data;
}

/**
 * Mendapatkan semua website yang terdaftar
 * @returns {Promise<Array>} - Array berisi informasi semua website
 */
export async function getAllWebsites() {
  const { data, error } = await supabase
    .from('websites')
    .select('*')
    .order('name');

  if (error) {
    console.error('Error fetching websites:', error);
    return [];
  }

  return data;
}

/**
 * Mendapatkan context website dari path URL
 * @param {string} path - Full path URL (e.g., "/kelantan-food-review/about")
 * @returns {Promise<Object>} - Website context dan clean path
 */
export async function getWebsiteContext(path) {
  // Hapus leading slash jika ada
  const cleanPath = path.startsWith('/') ? path.substring(1) : path;
  
  // Split path untuk mendapatkan slug website
  const pathParts = cleanPath.split('/');
  const websiteSlug = pathParts[0];

  // Dapatkan informasi website
  const website = await getWebsiteBySlug(websiteSlug);

  // Path bersih tanpa slug website
  const cleanRoutePath = pathParts.slice(1).join('/');

  return {
    website,
    path: cleanRoutePath
  };
}

/**
 * Helper untuk membuat URL dengan slug website
 * @param {Object} website - Informasi website
 * @param {string} path - Path yang akan ditambahkan
 * @returns {string} - URL lengkap dengan slug website
 */
export function createWebsiteUrl(website = DEFAULT_WEBSITE, path = '') {
  const cleanPath = path.startsWith('/') ? path.substring(1) : path;
  return `/${website.slug}/${cleanPath}`;
}

/**
 * Validasi apakah sebuah path valid untuk website tertentu
 * @param {string} path - Path yang akan divalidasi
 * @param {Object} website - Informasi website
 * @returns {boolean} - True jika path valid untuk website tersebut
 */
export function isValidWebsitePath(path, website = DEFAULT_WEBSITE) {
  const cleanPath = path.startsWith('/') ? path.substring(1) : path;
  const pathParts = cleanPath.split('/');
  return pathParts[0] === website.slug;
}
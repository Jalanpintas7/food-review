import { getArticleById, getRelatedArticles, incrementArticleVisit } from '$lib/articles';

/** @type {import('./$types').PageLoad} */
export async function load({ params, parent }) {
  const { website } = await parent();
  const { id, slug } = params;
  
  // Ambil artikel berdasarkan ID
  const article = await getArticleById(website.id, id);
  
  if (!article) {
    return {
      status: 404,
      error: new Error('Artikel tidak ditemukan')
    };
  }
  
  // Tambah jumlah kunjungan artikel
  await incrementArticleVisit(id);
  
  // Ambil artikel terkait berdasarkan kategori
  const relatedArticles = await getRelatedArticles(website.id, article.category, article.id);
  
  return {
    article,
    relatedArticles
  };
}
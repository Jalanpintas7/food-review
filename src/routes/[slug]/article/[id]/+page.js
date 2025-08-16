import { getArticleById, getRelatedArticles, incrementArticleVisit, getArticlesByCategory } from '$lib/articles';
import { getCommentsByArticle } from '$lib/comments';

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
  // Ambil komentar artikel
  const comments = await getCommentsByArticle(article.id);
  // Ambil artikel trending untuk sidebar
  const trendingArticles = await getArticlesByCategory(website.id, null, 5, 0, true);
  
  return {
    article,
    relatedArticles,
    comments,
    trendingArticles
  };
}
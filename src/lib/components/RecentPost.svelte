<script>
  
  const latestArticles = [
    {
      id: 1,
      title: '5D4N Itinerary For Your Next Budget-Friendly Trip To Shenzhen',
      category: 'Travel',
      author: 'Jessica Lim',
      date: '4 Agustus 2025',
      excerpt: 'Complete travel guide for an affordable adventure in Shenzhen',
      image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop&crop=center'
    },
    {
      id: 2,
      title: 'MSME Digital Grant 2025 Is Back…',
      category: 'News',
      author: 'Thexeilia Yeap',
      date: '17 Juli 2025',
      excerpt: 'Latest updates on digital grants for small businesses',
      image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=300&h=200&fit=crop&crop=center'
    },
    {
      id: 3,
      title: '5 Must-Visit Spots For Creamy Durians In Kelantan (2025 Edition)',
      category: 'Food',
      author: 'Thexeilia Yeap',
      date: '1 Juli 2025',
      excerpt: 'Discover the best durian spots in Kelantan this year',
      image: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=300&h=200&fit=crop&crop=center'
    },
    {
      id: 4,
      title: '31 BEST Cafes You Must Visit In Kelantan (2025 Edition)',
      category: 'Cafe',
      author: 'Dany',
      date: '28 Juni 2025',
      excerpt: 'Comprehensive guide to the top cafes in Kelantan',
      image: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=300&h=200&fit=crop&crop=center'
    },
    {
      id: 5,
      title: '15 Popular Breakfast Spots In Kelantan To Start Your Day (2025 Edition)',
      category: 'Food',
      author: 'Dany',
      date: '25 Juni 2025',
      excerpt: 'Start your day right with these amazing breakfast locations',
      image: 'https://images.unsplash.com/photo-1494859802809-d069c3b71a8a?w=300&h=200&fit=crop&crop=center'
    }
  ];
</script>

<div class="space-y-6">
  {#each latestArticles as article, index}
    <article class="flex gap-4 bg-white rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 overflow-hidden">
      <div class="flex-shrink-0">
        <img 
          src={article.image} 
          alt={article.title}
          class="w-24 h-24 object-cover rounded-l-2xl"
        />
      </div>
      <div class="flex-1 p-4">
        <div class="flex items-center gap-2 mb-2">
          <span class="px-2 py-1 text-xs font-semibold text-white bg-red-600 rounded-full">
            {article.category}
          </span>
          {#if article.date}
            <span class="text-xs text-gray-500">
              {article.date}
            </span>
          {/if}
        </div>
        <h3 class="text-sm font-bold text-gray-900 mb-2 line-clamp-2">
          {article.title}
        </h3>
        {#if article.excerpt}
          <p class="text-gray-600 text-xs mb-2 line-clamp-2">
            {article.excerpt}
          </p>
        {/if}
        <div class="flex items-center justify-between">
          <span class="text-xs text-gray-500 font-medium">
            {article.author}
          </span>
          <button class="text-red-600 text-xs font-semibold hover:text-red-700 transition-colors">
            Baca Selengkapnya
          </button>
        </div>
      </div>
    </article>
  {/each}
</div>

<div class="text-center mt-8">
  <button class="bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 text-white font-bold py-3 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl">
    Muat Lebih Banyak
  </button>
</div>

<style>
  .line-clamp-2 {
    line-clamp: 2;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
</style>

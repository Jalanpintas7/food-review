<script>
  import { fly } from 'svelte/transition';
  // State untuk "Read more"
  const articlesPerLoad = 12;
  let visibleCount = articlesPerLoad;
  let isLoadingMore = false;
  let isLoadingLess = false;
  let prevVisibleCount = visibleCount;
  let lastRemovedStartIndex = 0;
  let lastActionWasLess = false;

  const featuredArticles = [
    {
      id: 1,
      image: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'Nasi Lemak Terbaik di Kelantan - 10 Tempat Wajib Coba',
      author: 'BY OMNY',
      excerpt: 'Discover the best Nasi Lemak spots in Kelantan with our comprehensive guide to 10 must-try locations.',
      height: 'tall'
    },
    {
      id: 2,
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'Char Kway Teow Legendaris - Warisan Kuliner Kelantan',
      author: 'BY OMNY',
      excerpt: 'Explore the legendary Char Kway Teow of Kelantan, a culinary heritage passed down through generations.',
      height: 'medium'
    },
    {
      id: 3,
      image: 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'Mee Goreng Mamak - Resep Rahasia yang Bikin Ketagihan',
      author: 'BY OMNY',
      excerpt: 'Discover the secret recipes behind the addictive Mee Goreng Mamak that keeps people coming back.',
      height: 'short'
    },
    {
      id: 4,
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop',
      category: 'RECIPE',
      title: 'Traditional Indonesian Cuisine: A Culinary Journey',
      author: 'BY SARAH',
      excerpt: 'Explore the rich flavors and traditional cooking methods of Indonesian cuisine.',
      height: 'tall'
    },
    {
      id: 5,
      image: 'https://images.unsplash.com/photo-1504674900240-9a9049b7d8ce?w=400&h=300&fit=crop',
      category: 'CAFE',
      title: 'Best Coffee Shops in Jakarta: A Complete Guide',
      author: 'BY MIKE',
      excerpt: 'Discover the hidden gems and popular coffee spots that make Jakarta a coffee lover\'s paradise.',
      height: 'medium'
    },
    {
      id: 6,
      image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=300&fit=crop',
      category: 'RESTAURANT',
      title: 'Fine Dining Experience: Top Restaurants in Indonesia',
      author: 'BY LISA',
      excerpt: 'Experience the best of Indonesian fine dining with our curated list of top restaurants.',
      height: 'short'
    },
    {
      id: 7,
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
      category: 'STREET FOOD',
      title: 'Street Food Adventures: Must-Try Local Delicacies',
      author: 'BY ALEX',
      excerpt: 'Embark on a culinary adventure through Indonesia\'s vibrant street food scene.',
      height: 'tall'
    },
    {
      id: 8,
      image: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'Healthy Eating: Modern Indonesian Diet Trends',
      author: 'BY EMMA',
      excerpt: 'Learn about the latest health-conscious eating trends in Indonesian cuisine.',
      height: 'medium'
    },
    {
      id: 9,
      image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=300&fit=crop',
      category: 'RECIPE',
      title: 'Quick and Easy Indonesian Recipes for Beginners',
      author: 'BY DAVID',
      excerpt: 'Master the basics of Indonesian cooking with these simple and delicious recipes.',
      height: 'short'
    },
    {
      id: 10,
      image: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400&h=300&fit=crop',
      category: 'RESTAURANT',
      title: 'Hidden Gems: Underrated Eateries You Must Try',
      author: 'BY NINA',
      excerpt: 'A curated list of lesser-known restaurants serving unforgettable dishes.',
      height: 'tall'
    },
    {
      id: 11,
      image: 'https://images.unsplash.com/photo-1447078806655-40579c2520d6?w=400&h=300&fit=crop',
      category: 'DESSERT',
      title: 'Sweet Escape: Best Desserts Around the City',
      author: 'BY ALEX',
      excerpt: 'From classic cakes to modern confections, satisfy your sweet tooth.',
      height: 'medium'
    },
    {
      id: 12,
      image: 'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=400&h=300&fit=crop',
      category: 'HEALTH',
      title: 'Plant-Based Power: Tasty Vegan Dishes to Try',
      author: 'BY EMMA',
      excerpt: 'Delicious vegan meals that are as healthy as they are flavorful.',
      height: 'short'
    },
    {
      id: 13,
      image: 'https://images.unsplash.com/photo-1481833761820-0509d3217039?w=400&h=300&fit=crop',
      category: 'DRINKS',
      title: 'Signature Drinks: Mixology Trends This Year',
      author: 'BY LEO',
      excerpt: 'A look at creative cocktails and non-alcoholic options taking the scene.',
      height: 'tall'
    },
    {
      id: 14,
      image: 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=400&h=300&fit=crop',
      category: 'STREET FOOD',
      title: 'Night Market Bites: Street Food After Dark',
      author: 'BY DANY',
      excerpt: 'The best late-night snacks and the stories behind them.',
      height: 'medium'
    },
    {
      id: 15,
      image: 'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=400&h=300&fit=crop',
      category: 'RECIPE',
      title: 'One-Pot Wonders: Easy Meals with Minimal Cleanup',
      author: 'BY SARAH',
      excerpt: 'Save time in the kitchen with these comforting, simple dishes.',
      height: 'short'
    },
    {
      id: 16,
      image: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'From Farm to Table: Fresh Ingredients Spotlight',
      author: 'BY LISA',
      excerpt: 'Why seasonal produce matters and where to find the best picks.',
      height: 'tall'
    },
    {
      id: 17,
      image: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400&h=300&fit=crop',
      category: 'CAFE',
      title: 'Third-Wave Coffee: What Makes It Different?',
      author: 'BY MIKE',
      excerpt: 'Understanding roasting profiles, brewing methods, and tasting notes.',
      height: 'medium'
    },
    {
      id: 18,
      image: 'https://images.unsplash.com/photo-1484980972926-edee96e0960d?w=400&h=300&fit=crop',
      category: 'RESTAURANT',
      title: 'Chef\'s Table: Interviews with Local Chefs',
      author: 'BY LEO',
      excerpt: 'Culinary philosophies and inspirations behind iconic menus.',
      height: 'short'
    },
    {
      id: 19,
      image: 'https://images.unsplash.com/photo-1504674900240-9a9049b7d8ce?w=400&h=300&fit=crop',
      category: 'FOOD',
      title: 'Budget Bites: Great Meals Without Breaking the Bank',
      author: 'BY ALEX',
      excerpt: 'Affordable spots serving delicious food with generous portions.',
      height: 'tall'
    },
    {
      id: 20,
      image: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400&h=300&fit=crop',
      category: 'TRAVEL',
      title: 'Culinary Road Trip: Flavors Across the Archipelago',
      author: 'BY DAVID',
      excerpt: 'A journey through regional specialties and local delicacies.',
      height: 'medium'
    },
    {
      id: 21,
      image: 'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=400&h=300&fit=crop',
      category: 'HEALTH',
      title: 'Balanced Bowls: Nutritious and Delicious',
      author: 'BY EMMA',
      excerpt: 'How to build a balanced bowl with proteins, grains, and greens.',
      height: 'short'
    },
    {
      id: 22,
      image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop',
      category: 'RECIPE',
      title: 'Meal Prep 101: Save Time, Eat Better',
      author: 'BY SARAH',
      excerpt: 'Tips and recipes to streamline your weeknight cooking.',
      height: 'tall'
    },
    {
      id: 23,
      image: 'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=400&h=300&fit=crop',
      category: 'DRINKS',
      title: 'Tea Culture: Brewing the Perfect Cup',
      author: 'BY NINA',
      excerpt: 'Exploring varieties, temperatures, and steep times for better tea.',
      height: 'medium'
    },
    {
      id: 24,
      image: 'https://images.unsplash.com/photo-1506086679524-493c64fdfaa6?w=400&h=300&fit=crop',
      category: 'STREET FOOD',
      title: 'Festival Foods: Limited-Time Treats You Can\'t Miss',
      author: 'BY DANY',
      excerpt: 'Seasonal bites that appear during special celebrations and fairs.',
      height: 'short'
    }
  ];

  // Artikel yang terlihat saat ini
  $: visibleArticles = featuredArticles.slice(0, visibleCount);
  $: hasMore = visibleCount < featuredArticles.length;
  $: hasLess = visibleCount > articlesPerLoad;

  function loadMore() {
    lastActionWasLess = false;
    prevVisibleCount = visibleCount;
    isLoadingMore = true;
    visibleCount = Math.min(
      visibleCount + articlesPerLoad,
      featuredArticles.length
    );
    setTimeout(() => {
      isLoadingMore = false;
    }, 450);
  }

  function showLess() {
    lastActionWasLess = true;
    prevVisibleCount = visibleCount;
    isLoadingLess = true;
    const target = Math.max(articlesPerLoad, visibleCount - articlesPerLoad);
    lastRemovedStartIndex = target;
    visibleCount = target;
    setTimeout(() => {
      isLoadingLess = false;
    }, 450);
  }


</script>

<style>
  .staggered-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    grid-auto-rows: 20px;
    grid-gap: 24px;
  }

  .card-short {
    grid-row: span 6;
  }

  .card-medium {
    grid-row: span 7;
  }

  .card-tall {
    grid-row: span 8;
  }

  .card-image-short {
    height: 140px;
  }

  .card-image-medium {
    height: 160px;
  }

  .card-image-tall {
    height: 180px;
  }

  .card-overlay {
    background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.3) 50%, rgba(0, 0, 0, 0.8) 100%);
    opacity: 1;
    transition: opacity 0.3s ease;
  }

  .card-hover-overlay {
    background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.4) 30%, rgba(0, 0, 0, 0.9) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .card:hover .card-hover-overlay {
    opacity: 1;
  }

  .card:hover .card-overlay {
    opacity: 0;
  }

  .card-content {
    transform: translateY(0);
    transition: transform 0.3s ease;
  }

  .card:hover .card-content {
    transform: translateY(-5px);
  }

  .card-details {
    opacity: 0;
    transform: translateY(20px);
    transition: all 0.3s ease;
  }

  .card:hover .card-details {
    opacity: 1;
    transform: translateY(0);
  }

  @media (max-width: 640px) {
    .staggered-grid {
      grid-template-columns: 1fr;
      grid-gap: 16px;
    }
  }

  @media (min-width: 641px) and (max-width: 1024px) {
    .staggered-grid {
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      grid-gap: 20px;
    }
  }

  @media (min-width: 1025px) {
    .staggered-grid {
      grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
      grid-gap: 24px;
    }
  }
</style>

<div class="relative">
  <div class="pointer-events-none absolute -left-6 top-0 h-full w-24 bg-gradient-to-r from-white to-transparent z-10"></div>
  <div class="pointer-events-none absolute -right-6 top-0 h-full w-24 bg-gradient-to-l from-white to-transparent z-10"></div>
  
  <div class="staggered-grid">
    {#each visibleArticles as article, index (article.id)}
      <article
        class="card card-{article.height} bg-white rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 overflow-hidden group cursor-pointer"
        in:fly={{
          y: 24,
          opacity: 0,
          duration: 350,
          delay: index >= visibleCount - articlesPerLoad
            ? (index - (visibleCount - articlesPerLoad)) * 30
            : 0
        }}
        out:fly={{
          y: -24,
          opacity: 0,
          duration: 350,
          delay: lastActionWasLess && index >= lastRemovedStartIndex
            ? (prevVisibleCount - 1 - index) * 30
            : 0
        }}
      >
        <div class="relative h-full">
          <img 
            src={article.image} 
            alt={article.title}
            class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
          />
          
          <!-- Category Badge -->
          <div class="absolute top-4 left-4 z-20">
            <span class="px-3 py-1 text-xs font-semibold text-white bg-red-600 rounded-full shadow-lg">
              {article.category}
            </span>
          </div>
          
          <!-- Default Title Overlay (visible when not hovered) -->
          <div class="absolute bottom-0 left-0 right-0 card-overlay">
            <div class="p-4 text-white">
              <h3 class="text-base font-bold line-clamp-1">
                {article.title}
              </h3>
            </div>
          </div>
          
          <!-- Hover Overlay with Full Content -->
          <div class="absolute inset-0 card-hover-overlay">
            <div class="absolute bottom-0 left-0 right-0 p-4 text-white">
              <div class="card-content">
                <h3 class="text-base font-bold mb-2 line-clamp-2">
                  {article.title}
                </h3>
                
                <div class="card-details">
                  {#if article.excerpt}
                    <p class="text-gray-200 text-xs mb-3 line-clamp-2">
                      {article.excerpt}
                    </p>
                  {/if}
                  
                  <div class="flex items-center justify-between">
                    <span class="text-xs text-gray-300 font-medium">
                      {article.author}
                    </span>
                    <a href={`/article/${article.id}`} class="text-white text-xs font-semibold hover:text-red-300 transition-colors duration-300 flex items-center gap-1 group/btn">
                      Baca Selengkapnya
                      <svg class="w-3 h-3 transform group-hover/btn:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </article>
    {/each}
  </div>
</div>

<div class="flex justify-center items-center mt-12 gap-4">
  {#if hasLess}
  <button
    on:click={showLess}
    class="px-8 py-3 text-sm font-semibold text-gray-700 bg-white border-2 border-gray-200 rounded-xl hover:bg-gray-50 hover:border-gray-300 transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl disabled:opacity-70 disabled:cursor-not-allowed"
    disabled={isLoadingLess}
    aria-busy={isLoadingLess}
  >
    {#if isLoadingLess}
      <span class="inline-flex items-center gap-2">
        <span class="w-4 h-4 border-2 border-gray-600/60 border-t-transparent rounded-full animate-spin"></span>
        Mengurangi...
      </span>
    {:else}
      Tampilkan Lebih Sedikit
    {/if}
  </button>
  {/if}
  {#if hasMore}
  <button 
    on:click={loadMore}
    class="px-8 py-3 text-sm font-semibold text-white bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl disabled:opacity-80 disabled:cursor-not-allowed"
    disabled={isLoadingMore}
    aria-busy={isLoadingMore}
  >
    {#if isLoadingMore}
      <span class="inline-flex items-center gap-2">
        <span class="w-4 h-4 border-2 border-white/70 border-t-transparent rounded-full animate-spin"></span>
        Memuat...
      </span>
    {:else}
      Muat Lebih Banyak
    {/if}
  </button>
  {/if}
</div>

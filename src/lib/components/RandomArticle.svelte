<script>
  import { onDestroy, onMount, tick } from 'svelte';

  // Data artikel (acak akan diambil dari sini)
  const baseArticles = [
    {
      id: 1,
      image: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Nasi Lemak Terbaik di Kelantan - 10 Tempat Wajib Coba',
      author: 'BY OMNY',
      excerpt: 'Discover the best Nasi Lemak spots in Kelantan with our comprehensive guide.'
    },
    {
      id: 2,
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Char Kway Teow Legendaris - Warisan Kuliner Kelantan',
      author: 'BY OMNY',
      excerpt: 'Explore the legendary Char Kway Teow of Kelantan, a culinary heritage.'
    },
    {
      id: 3,
      image: 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Mee Goreng Mamak - Resep Rahasia yang Bikin Ketagihan',
      author: 'BY OMNY',
      excerpt: 'Discover the secret recipes behind the addictive Mee Goreng Mamak.'
    },
    {
      id: 4,
      image: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Laksa Kelantan - Kuah Kental yang Menggugah Selera',
      author: 'BY OMNY',
      excerpt: 'Discover the rich and flavorful Laksa Kelantan with its unique broth.'
    },
    {
      id: 5,
      image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Roti Canai - Sarapan Favorit Masyarakat Malaysia',
      author: 'BY OMNY',
      excerpt: 'Experience the perfect breakfast with traditional Roti Canai.'
    },
    {
      id: 6,
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Satay Ayam - Sate dengan Bumbu Kacang yang Nikmat',
      author: 'BY OMNY',
      excerpt: 'Savor the delicious Satay Ayam with its perfect peanut sauce.'
    },
    {
      id: 7,
      image: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop',
      category: 'STREET FOOD',
      title: 'Street Food Adventures: Must-Try Local Delicacies',
      author: 'BY ALEX',
      excerpt: "A culinary adventure through vibrant street food scenes."
    },
    {
      id: 8,
      image: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600&h=400&fit=crop',
      category: 'FOOD',
      title: 'Healthy Eating: Modern Indonesian Diet Trends',
      author: 'BY EMMA',
      excerpt: 'Health-conscious eating trends in Indonesian cuisine.'
    },
    {
      id: 9,
      image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=600&h=400&fit=crop',
      category: 'RECIPE',
      title: 'Quick and Easy Indonesian Recipes for Beginners',
      author: 'BY DAVID',
      excerpt: 'Simple and delicious Indonesian recipes.'
    },
    {
      id: 10,
      image: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&h=400&fit=crop',
      category: 'RESTAURANT',
      title: 'Hidden Gems: Underrated Eateries You Must Try',
      author: 'BY NINA',
      excerpt: 'Lesser-known restaurants serving unforgettable dishes.'
    },
    {
      id: 11,
      image: 'https://images.unsplash.com/photo-1447078806655-40579c2520d6?w=600&h=400&fit=crop',
      category: 'DESSERT',
      title: 'Sweet Escape: Best Desserts Around the City',
      author: 'BY ALEX',
      excerpt: 'From classic cakes to modern confections.'
    },
    {
      id: 12,
      image: 'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=600&h=400&fit=crop',
      category: 'HEALTH',
      title: 'Plant-Based Power: Tasty Vegan Dishes to Try',
      author: 'BY EMMA',
      excerpt: 'Delicious vegan meals packed with flavor.'
    }
  ];

  let articles = [];
  let scroller;
  let track;
  let groupSize = 0;
  let groupWidth = 0;
  let secondStart = 0;
  let thirdStart = 0;
  let timer;
  export let intervalMs = 2000;

  function shuffle(array) {
    const cloned = array.slice();
    for (let i = cloned.length - 1; i > 0; i -= 1) {
      const j = Math.floor(Math.random() * (i + 1));
      [cloned[i], cloned[j]] = [cloned[j], cloned[i]];
    }
    return cloned;
  }

  function startAutoScroll() {
    stopAutoScroll();
    timer = setInterval(next, intervalMs);
  }

  function stopAutoScroll() {
    if (timer) {
      clearInterval(timer);
      timer = null;
    }
  }

  function next() {
    if (!scroller) return;
    const step = Math.max(240, Math.floor(scroller.clientWidth * 0.8));
    scroller.scrollBy({ left: step, behavior: 'smooth' });
  }

  function handleScroll() {
    if (!scroller || groupWidth === 0) return;
    if (scroller.scrollLeft >= thirdStart) {
      scroller.scrollLeft -= groupWidth;
    } else if (scroller.scrollLeft < secondStart - groupWidth + 1) {
      // dukung scroll ke kiri juga agar tetap mulus
      scroller.scrollLeft += groupWidth;
    }
  }

  onMount(async () => {
    const baseList = shuffle(baseArticles);
    groupSize = baseList.length;
    // gandakan untuk membuat track tak berujung (awal, tengah, akhir)
    articles = [...baseList, ...baseList, ...baseList];
    await tick();
    // hitung posisi awal grup tengah dan lebar satu grup
    const firstStart = track?.children?.[0]?.offsetLeft ?? 0;
    secondStart = track?.children?.[groupSize]?.offsetLeft ?? 0;
    thirdStart = track?.children?.[groupSize * 2]?.offsetLeft ?? 0;
    groupWidth = secondStart - firstStart;
    if (Number.isFinite(secondStart)) {
      scroller.scrollLeft = secondStart;
    }
    startAutoScroll();
  });

  onDestroy(() => {
    stopAutoScroll();
  });
</script>

<div class="relative">
  <div class="pointer-events-none absolute -left-6 top-0 h-full w-24 bg-gradient-to-r from-orange-50 to-transparent"></div>
  <div class="pointer-events-none absolute -right-6 top-0 h-full w-24 bg-gradient-to-l from-orange-50 to-transparent"></div>

  <div
    class="overflow-x-hidden"
    bind:this={scroller}
    on:mouseenter={stopAutoScroll}
    on:mouseleave={startAutoScroll}
    role="region"
    aria-label="Carousel artikel acak"
    on:scroll={handleScroll}
  >
    <div class="flex gap-6 py-2" bind:this={track}>
      {#each articles as article, i}
        <article class="flex-shrink-0 w-80 bg-white rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 overflow-hidden">
          <div class="relative">
            <img 
              src={article.image} 
              alt={article.title}
              class="w-full h-48 object-cover"
            />
            <div class="absolute top-4 left-4">
              <span class="px-3 py-1 text-xs font-semibold text-white bg-red-600 rounded-full">
                {article.category}
              </span>
            </div>
          </div>
          <div class="p-6">
            <h3 class="text-lg font-bold text-gray-900 mb-2 line-clamp-2">
              {article.title}
            </h3>
            {#if article.excerpt}
              <p class="text-gray-600 text-sm mb-3 line-clamp-2">
                {article.excerpt}
              </p>
            {/if}
            <div class="flex items-center justify-between">
              <span class="text-xs text-gray-500 font-medium">
                {article.author}
              </span>
              <button class="text-red-600 text-sm font-semibold hover:text-red-700 transition-colors">
                Baca Selengkapnya
              </button>
            </div>
          </div>
        </article>
      {/each}
    </div>
  </div>

  <div class="mt-8 flex items-center justify-center gap-4">
    <button class="px-6 py-3 text-sm font-semibold text-gray-700 bg-white border-2 border-gray-200 rounded-xl hover:bg-gray-50 hover:border-gray-300 transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl" on:click={() => scroller && scroller.scrollBy({ left: -Math.max(240, Math.floor(scroller.clientWidth * 0.8)), behavior: 'smooth' })}>
      ← Sebelumnya
    </button>
    <button class="px-6 py-3 text-sm font-semibold text-white bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl" on:click={next}>
      Berikutnya →
    </button>
  </div>
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

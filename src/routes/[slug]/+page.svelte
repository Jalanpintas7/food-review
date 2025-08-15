<script>
  import FeaturedArticles from '$lib/components/PopularArticles.svelte';
  import CategoryShowcase from '$lib/components/RandomArticle.svelte';
  import RecentPost from '$lib/components/RecentPost.svelte';
  import TrendingSidebar from '$lib/components/Sidebar.svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';

  /** @type {import('./$types').PageData} */
  export let data;
</script>

<svelte:head>
  <title>{data.website.name} - Your Ultimate Food Review Guide</title>
  <meta name="description" content="Discover the best restaurants, cafes, and culinary experiences in Kelantan. Your ultimate guide to food reviews, recipes, and dining adventures." />
</svelte:head>

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Featured Articles Section -->
  <PageHeader 
    title="Artikel Terpopuler"
    description="Artikel terbaik yang sedang trending di komunitas kuliner Kelantan"
    icon="book"
  />

  <!-- Popular Articles -->
  <section class="py-16 bg-white">
    <div class="container mx-auto px-4">
      <FeaturedArticles articles={data.popularArticles} />
    </div>
  </section>
  
  <!-- Article Random -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50">
    <div class="container mx-auto px-4">
      <div class="text-center mb-12">
        <div class="inline-block p-2 bg-gradient-to-r from-orange-100 to-red-100 rounded-full mb-6">
          <div class="w-12 h-12 bg-gradient-to-br from-orange-600 to-red-600 rounded-full flex items-center justify-center mx-auto">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
            </svg>
          </div>
        </div>
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-orange-600 bg-clip-text text-transparent mb-4">
          Artikel Random
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-orange-500 to-red-600 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-3xl mx-auto text-lg leading-relaxed">
          Jelajahi berbagai kategori kuliner yang kami sajikan untuk Anda
        </p>
      </div>
      <CategoryShowcase articles={data.randomArticles} />
    </div>
  </section>
  
  <!-- Main Content Area -->
  <section class="py-16 bg-white">
    <div class="container mx-auto px-4">
      <div class="text-center mb-12">
        <div class="inline-block p-2 bg-gradient-to-r from-red-100 to-orange-100 rounded-full mb-6">
          <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-full flex items-center justify-center mx-auto">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
            </svg>
          </div>
        </div>
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Konten Terbaru
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-3xl mx-auto text-lg leading-relaxed">
          Artikel dan review terbaru dari tim {data.website.name}
        </p>
      </div>
      
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2">
          <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
            <RecentPost articles={data.latestArticles} />
          </div>
        </div>
        
        <!-- Sidebar -->
        <div class="lg:col-span-1">
          <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl shadow-xl border border-orange-100 transform hover:scale-105 transition-all duration-300">
            <TrendingSidebar articles={data.trendingArticles} />
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Call to Action Section -->
  <section class="py-20 bg-gradient-to-br from-red-600 to-orange-600">
    <div class="container mx-auto px-4">
      <div class="text-center">
        <div class="inline-block p-2 bg-white/20 rounded-full mb-6">
          <div class="w-16 h-16 bg-white rounded-full flex items-center justify-center mx-auto">
            <svg class="w-8 h-8 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
            </svg>
          </div>
        </div>
        <h2 class="text-4xl md:text-5xl font-bold text-white mb-6">
          Bergabung dengan Komunitas Kami
        </h2>
        <div class="w-32 h-1 bg-white mx-auto rounded-full mb-6"></div>
        <p class="text-white/90 max-w-3xl mx-auto text-xl leading-relaxed mb-8">
          Dapatkan update terbaru tentang review makanan, resep, dan acara kuliner eksklusif. 
          Bergabunglah dengan ribuan pecinta kuliner lainnya!
        </p>
        <div class="flex flex-wrap justify-center gap-4">
          <a href="/{data.website.slug}/about" class="bg-white hover:bg-gray-100 text-red-600 font-bold py-4 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl">
            Pelajari Lebih Lanjut
          </a>
          <a href="/{data.website.slug}/contact" class="bg-transparent hover:bg-white/10 text-white font-bold py-4 px-8 rounded-xl border-2 border-white hover:border-white/80 transition-all duration-300 transform hover:scale-105">
            Hubungi Kami
          </a>
        </div>
      </div>
    </div>
  </section>
</main>
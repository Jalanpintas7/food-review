<script>
  import FoodCard from '$lib/components/FoodCard.svelte';
  import AboutKelantanCard from '$lib/components/AboutKelantanCard.svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';
  import { onMount } from 'svelte';
  import { page } from '$app/stores';
  
  /** @type {import('./$types').PageData} */
  export let data;
  
  let articlesContainer;
  let loading = false;
  let offset = 0;
  let limit = 10;
  let articles = [];
  
  // Format tanggal dari ISO string ke format yang diinginkan
  function formatDate(isoString) {
    const date = new Date(isoString);
    const month = date.toLocaleString('en-US', { month: 'long' }).toUpperCase();
    const day = date.getDate();
    const year = date.getFullYear();
    return `${month} ${day}, ${year}`;
  }
  
  // Konversi data artikel dari database ke format yang dibutuhkan oleh FoodCard
  function mapArticleData(article) {
    return {
      id: article.id,
      title: article.title,
      author: article.author,
      date: formatDate(article.published_at),
      description: article.summary,
      image: article.thumbnail_image,
      category: article.category,
      slug: article.slug,
      minute_read: article.minute_read,
      tags: article.tags || [],
      labels: article.labels || []
    };
  }
  
  onMount(() => {
    // Inisialisasi artikel dari data yang diambil di +page.js
    articles = data.articles.map(mapArticleData);
    
    // Ensure all cards have consistent height
    setTimeout(() => {
      const cards = articlesContainer?.querySelectorAll('article');
      if (cards) {
        let maxHeight = 0;
        cards.forEach(card => {
          const height = card.offsetHeight;
          if (height > maxHeight) maxHeight = height;
        });
        
        cards.forEach(card => {
          card.style.minHeight = `${maxHeight}px`;
        });
      }
    }, 100);
  });
  
  // Fungsi untuk memuat artikel lebih banyak
  async function loadMoreArticles() {
    if (loading) return;
    
    loading = true;
    offset += limit;
    
    try {
      const response = await fetch(`/api/articles?websiteId=${data.website.id}&category=things-to-do&offset=${offset}&limit=${limit}`);
      const newArticles = await response.json();
      
      if (newArticles.length > 0) {
        articles = [...articles, ...newArticles.map(mapArticleData)];
        
        // Sesuaikan tinggi kartu setelah artikel baru dimuat
        setTimeout(() => {
          const cards = articlesContainer?.querySelectorAll('article');
          if (cards) {
            let maxHeight = 0;
            cards.forEach(card => {
              const height = card.offsetHeight;
              if (height > maxHeight) maxHeight = height;
            });
            
            cards.forEach(card => {
              card.style.minHeight = `${maxHeight}px`;
            });
          }
        }, 100);
      }
    } catch (error) {
      console.error('Error loading more articles:', error);
    } finally {
      loading = false;
    }
  }

  $: websiteSlug = $page.params.slug;
</script>

<svelte:head>
  <title>Things to Do - {data.website.name}</title>
  <meta name="description" content="Discover the best activities and things to do in Kelantan. Travel guides, attractions, and adventure tips." />
</svelte:head>

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Aktivitas Seru"
    description="Temukan aktivitas seru dan tempat menarik di Kelantan dengan panduan lengkap dari tim kami"
    icon="zap"
  />
  
  <!-- Main Content Area -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50" id="articles">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2">
          <!-- Articles List -->
          <div class="grid grid-cols-1 gap-8" bind:this={articlesContainer}>
            {#each articles as article}
              <FoodCard {article} websiteSlug={websiteSlug} />
            {/each}
          </div>
          
          <!-- Load More Button -->
          <div class="text-center mt-12">
            <button 
              class="bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 text-white font-bold py-4 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl {loading ? 'opacity-70 cursor-not-allowed' : ''}" 
              on:click={loadMoreArticles}
              disabled={loading}
            >
              <span class="flex items-center justify-center">
                {#if loading}
                  <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  Memuat...
                {:else}
                  <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                  Muat Artikel Lainnya
                {/if}
              </span>
            </button>
          </div>
        </div>
        
        <!-- Sidebar -->
        <div class="lg:col-span-1 space-y-8">
          <!-- About Activities Section -->
          <AboutKelantanCard 
            title="Tentang Aktivitas Kelantan"
            description1="Kelantan menawarkan berbagai aktivitas menarik dari wisata budaya hingga petualangan outdoor. Setiap aktivitas memberikan pengalaman unik tentang kehidupan di Kelantan."
            description2="Dari mengunjungi museum bersejarah hingga menikmati sunset di pantai, aktivitas di Kelantan cocok untuk semua jenis wisatawan dengan berbagai minat."
            tipsTitle="Tips Aktivitas"
            tipsContent="Rencanakan aktivitas sesuai musim dan cuaca. Aktivitas outdoor sebaiknya dilakukan di pagi atau sore hari untuk menghindari panas terik."
            icon="🎯"
          />
        </div>
      </div>
    </div>
  </section>
</main>
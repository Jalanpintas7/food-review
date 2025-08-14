<script>
  import Header from '$lib/components/Header.svelte';
  import FoodNavigation from '$lib/components/NavigationMenu.svelte';
  import Footer from '$lib/components/Footer.svelte';
  import FoodCard from '$lib/components/FoodCard.svelte';
  import AboutKelantanCard from '$lib/components/AboutKelantanCard.svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';
  import { onMount } from 'svelte';
  
  let articlesContainer;
  
  onMount(() => {
    // Ensure all cards have consistent height
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
  });
  
  const cafeArticles = [
    {
      id: 1,
      title: "Kopi Terbaik di Kelantan - 15 Coffee Shop Wajib Coba",
      author: "OMNY",
      date: "APRIL 26, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1504674900240-9a9049b7d8ce?w=400&h=300&fit=crop",
      category: "Coffee"
    },
    {
      id: 2,
      title: "Teh Tarik Legendaris - Warisan Minuman Malaysia",
      author: "OMNY",
      date: "APRIL 25, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=400&h=300&fit=crop",
      category: "Tea"
    },
    {
      id: 3,
      title: "Bubble Tea Trend - Minuman Populer di Kelantan",
      author: "OMNY",
      date: "APRIL 24, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1481833761820-0509d3217039?w=400&h=300&fit=crop",
      category: "Bubble Tea"
    },
    {
      id: 4,
      title: "Cafe Instagramable - Tempat Foto Terbaik di Kelantan",
      author: "OMNY",
      date: "APRIL 23, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400&h=300&fit=crop",
      category: "Cafe"
    },
    {
      id: 5,
      title: "Dessert Cafe - Tempat Pencuci Mulut Terbaik",
      author: "OMNY",
      date: "APRIL 22, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1447078806655-40579c2520d6?w=400&h=300&fit=crop",
      category: "Dessert"
    },
    {
      id: 6,
      title: "Rooftop Cafe - Menikmati Kopi dengan Pemandangan Indah",
      author: "OMNY",
      date: "APRIL 21, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400&h=300&fit=crop",
      category: "Rooftop"
    }
  ];
</script>

<svelte:head>
  <title>Cafe - Bangily Food Review</title>
  <meta name="description" content="Discover the best cafes and coffee shops in Kelantan. Reviews, recommendations, and coffee adventures." />
</svelte:head>

<Header />
<FoodNavigation />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Artikel Cafe"
    description="Temukan cafe dan coffee shop terbaik di Kelantan dengan review lengkap dan rekomendasi dari tim kami"
    icon="coffee"
  />
  
  <!-- Main Content Area -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50" id="articles">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2">
          <!-- Articles List -->
          <div class="grid grid-cols-1 gap-8" bind:this={articlesContainer}>
            {#each cafeArticles as article}
              <FoodCard {article} />
            {/each}
          </div>
          
          <!-- Load More Button -->
          <div class="text-center mt-12">
            <button class="bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 text-white font-bold py-4 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl">
              <span class="flex items-center justify-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                </svg>
                Muat Artikel Lainnya
              </span>
            </button>
          </div>
        </div>
        
        <!-- Sidebar -->
        <div class="lg:col-span-1 space-y-8">
          <!-- About Cafe Section -->
          <AboutKelantanCard 
            title="Tentang Cafe Kelantan"
            description1="Kelantan memiliki scene cafe yang berkembang pesat dengan berbagai pilihan dari coffee shop tradisional hingga modern. Setiap cafe memiliki karakter dan suasana yang unik."
            description2="Dari teh tarik legendaris hingga specialty coffee, cafe di Kelantan menawarkan pengalaman minum yang beragam dengan cita rasa lokal yang autentik."
            tipsTitle="Tips Cafe"
            tipsContent="Kunjungi cafe di pagi hari untuk menghindari keramaian. Cafe lokal biasanya memiliki menu sarapan terbaik dengan harga terjangkau."
            icon="☕"
          />
        </div>
      </div>
    </div>
  </section>

</main>

<Footer />


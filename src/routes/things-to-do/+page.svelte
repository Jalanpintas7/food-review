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
  
  const activitiesArticles = [
    {
      id: 1,
      title: "10 Aktivitas Seru di Kelantan - Panduan Lengkap Wisatawan",
      author: "OMNY",
      date: "APRIL 26, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop",
      category: "Activities"
    },
    {
      id: 2,
      title: "Street Art Hunting di Georgetown - Seni Jalanan Terbaik",
      author: "OMNY",
      date: "APRIL 25, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=400&h=300&fit=crop",
      category: "Art"
    },
    {
      id: 3,
      title: "Pulau Kelantan dengan Sepeda - Rute Terbaik untuk Bersepeda",
      author: "OMNY",
      date: "APRIL 24, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1544191696-102dbdaeeaa5?w=400&h=300&fit=crop",
      category: "Cycling"
    },
    {
      id: 4,
      title: "Sunset di Batu Ferringhi - Tempat Terbaik Menikmati Matahari Terbenam",
      author: "OMNY",
      date: "APRIL 23, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop",
      category: "Sunset"
    },
    {
      id: 5,
      title: "Museum Hopping di Kelantan - Sejarah dan Budaya dalam Satu Hari",
      author: "OMNY",
      date: "APRIL 22, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop",
      category: "Museum"
    },
    {
      id: 6,
      title: "Night Market Adventure - Pasar Malam Terbaik di Kelantan",
      author: "OMNY",
      date: "APRIL 21, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop",
      category: "Night Market"
    }
  ];
</script>

<svelte:head>
  <title>Things to Do - Bangily Food Review</title>
  <meta name="description" content="Discover the best activities and things to do in Kelantan. Travel guides, attractions, and adventure tips." />
</svelte:head>

<Header />
<FoodNavigation />

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
            {#each activitiesArticles as article}
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

<Footer />


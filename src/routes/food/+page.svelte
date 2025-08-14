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
  
  const foodArticles = [
    {
      id: 1,
      title: "Nasi Lemak Terbaik di Kelantan - 10 Tempat Wajib Coba",
      author: "OMNY",
      date: "APRIL 26, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop",
      category: "Local Food"
    },
    {
      id: 2,
      title: "Char Kway Teow Legendaris - Warisan Kuliner Kelantan",
      author: "OMNY",
      date: "APRIL 25, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
      category: "Street Food"
    },
    {
      id: 3,
      title: "Mee Goreng Mamak - Resep Rahasia yang Bikin Ketagihan",
      author: "OMNY",
      date: "APRIL 24, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=400&h=300&fit=crop",
      category: "Noodles"
    },
    {
      id: 4,
      title: "Laksa Kelantan - Kuah Kental yang Menggugah Selera",
      author: "OMNY",
      date: "APRIL 23, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400&h=300&fit=crop",
      category: "Soup"
    },
    {
      id: 5,
      title: "Roti Canai - Sarapan Favorit Masyarakat Malaysia",
      author: "OMNY",
      date: "APRIL 22, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop",
      category: "Breakfast"
    },
    {
      id: 6,
      title: "Satay Ayam - Sate dengan Bumbu Kacang yang Nikmat",
      author: "OMNY",
      date: "APRIL 21, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop",
      category: "Grilled"
    }
  ];
</script>

<svelte:head>
  <title>Food - Bangily Food Review</title>
  <meta name="description" content="Discover the best local food in Kelantan. Reviews, recommendations, and culinary adventures." />
</svelte:head>

<Header />
<FoodNavigation />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Artikel Makanan"
    description="Temukan artikel terbaik tentang makanan lokal Kelantan dan review restoran terpercaya"
    icon="book"
  />
  
  <!-- Main Content Area -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50" id="articles">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2">
          <!-- Articles List -->
          <div class="grid grid-cols-1 gap-8" bind:this={articlesContainer}>
            {#each foodArticles as article}
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
          <!-- About Food Section -->
          <AboutKelantanCard 
            title="Tentang Kuliner Kelantan"
            description1="Kelantan dikenal sebagai Pearl of the Orient dan merupakan surga kuliner Malaysia. Makanan di sini adalah perpaduan sempurna dari budaya Melayu, Cina, India, dan Peranakan."
            description2="Dari street food legendaris hingga restoran fine dining, setiap hidangan memiliki cerita dan cita rasa yang unik yang mencerminkan keragaman budaya Kelantan."
            tipsTitle="Tips Makan"
            tipsContent="Coba makanan di pagi hari untuk mendapatkan rasa terbaik. Street food di Kelantan biasanya lebih segar dan lezat di pagi hari."
            icon="🍽️"
          />
        </div>
      </div>
    </div>
  </section>

</main>

<Footer />

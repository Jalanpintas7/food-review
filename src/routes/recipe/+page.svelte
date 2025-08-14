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
  
  const recipeArticles = [
    {
      id: 1,
      title: "Resep Nasi Lemak Terbaik - Masakan Tradisional Malaysia",
      author: "OMNY",
      date: "APRIL 26, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop",
      category: "Traditional"
    },
    {
      id: 2,
      title: "Cara Membuat Char Kway Teow - Resep Rahasia Chef",
      author: "OMNY",
      date: "APRIL 25, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
      category: "Noodles"
    },
    {
      id: 3,
      title: "Resep Laksa Kelantan - Kuah Asam yang Menggugah Selera",
      author: "OMNY",
      date: "APRIL 24, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400&h=300&fit=crop",
      category: "Soup"
    },
    {
      id: 4,
      title: "Cara Membuat Roti Canai - Resep Roti Pipih Malaysia",
      author: "OMNY",
      date: "APRIL 23, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop",
      category: "Bread"
    },
    {
      id: 5,
      title: "Resep Satay Ayam - Sate dengan Bumbu Kacang",
      author: "OMNY",
      date: "APRIL 22, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop",
      category: "Grilled"
    },
    {
      id: 6,
      title: "Cara Membuat Teh Tarik - Minuman Tradisional Malaysia",
      author: "OMNY",
      date: "APRIL 21, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=400&h=300&fit=crop",
      category: "Drinks"
    }
  ];
</script>

<svelte:head>
  <title>Recipe - Bangily Food Review</title>
  <meta name="description" content="Discover authentic Malaysian recipes and cooking tips. Traditional dishes, modern twists, and culinary secrets from Kelantan." />
</svelte:head>

<Header />
<FoodNavigation />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Resep Masakan"
    description="Temukan resep masakan Malaysia autentik dengan panduan lengkap dan tips memasak dari tim kami"
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
            {#each recipeArticles as article}
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
          <!-- About Recipe Section -->
          <AboutKelantanCard 
            title="Tentang Resep Kelantan"
            description1="Resep masakan Kelantan adalah warisan kuliner yang telah diturunkan dari generasi ke generasi. Setiap resep memiliki cerita dan teknik memasak yang unik."
            description2="Dari masakan tradisional hingga kreasi modern, resep Kelantan menggabungkan rempah-rempah lokal dengan teknik memasak yang telah disempurnakan selama berabad-abad."
            tipsTitle="Tips Memasak"
            tipsContent="Gunakan rempah-rempah segar untuk hasil terbaik. Masakan Kelantan membutuhkan kesabaran dalam memasak untuk mendapatkan cita rasa yang sempurna."
            icon="👨‍🍳"
          />
        </div>
      </div>
    </div>
  </section>

</main>

<Footer />

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
  
  const eventsArticles = [
    {
      id: 1,
      title: "George Town Festival 2024 - Festival Seni dan Budaya Terbesar",
      author: "OMNY",
      date: "APRIL 26, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=400&h=300&fit=crop",
      category: "Festival"
    },
    {
      id: 2,
      title: "Kelantan Food Festival - Pesta Kuliner Tahunan",
      author: "OMNY",
      date: "APRIL 25, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop",
      category: "Food Festival"
    },
    {
      id: 3,
      title: "Thaipusam di Kelantan - Perayaan Religi yang Megah",
      author: "OMNY",
      date: "APRIL 24, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
      category: "Religious"
    },
    {
      id: 4,
      title: "Chinese New Year Celebration - Perayaan Imlek di Kelantan",
      author: "OMNY",
      date: "APRIL 23, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
      category: "Cultural"
    },
    {
      id: 5,
      title: "Hari Raya Aidilfitri - Perayaan Lebaran di Kelantan",
      author: "OMNY",
      date: "APRIL 22, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop",
      category: "Religious"
    },
    {
      id: 6,
      title: "Deepavali Festival - Festival Cahaya di Kelantan",
      author: "OMNY",
      date: "APRIL 21, 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
      category: "Cultural"
    }
  ];
</script>

<svelte:head>
  <title>Events - Bangily Food Review</title>
  <meta name="description" content="Discover the best events and festivals in Kelantan. Cultural celebrations, food festivals, and entertainment events." />
</svelte:head>

<Header />
<FoodNavigation />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Event & Festival"
    description="Temukan event dan festival menarik di Kelantan dengan panduan lengkap dari tim kami"
    icon="calendar"
  />
  
  <!-- Main Content Area -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50" id="articles">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2">
          <!-- Articles List -->
          <div class="grid grid-cols-1 gap-8" bind:this={articlesContainer}>
            {#each eventsArticles as article}
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
                Muat Event Lainnya
              </span>
            </button>
          </div>
        </div>
        
        <!-- Sidebar -->
        <div class="lg:col-span-1 space-y-8">
          <!-- About Events Section -->
          <AboutKelantanCard 
            title="Tentang Event Kelantan"
            description1="Kelantan adalah pusat budaya dan hiburan yang kaya dengan berbagai event dan festival sepanjang tahun. Setiap event menampilkan keragaman budaya dan tradisi lokal."
            description2="Dari festival makanan hingga perayaan keagamaan, event di Kelantan memberikan pengalaman yang mendalam tentang kehidupan dan budaya masyarakat setempat."
            tipsTitle="Tips Event"
            tipsContent="Periksa jadwal event sebelum berkunjung. Event besar biasanya membutuhkan reservasi dan persiapan khusus untuk mendapatkan pengalaman terbaik."
            icon="🎉"
          />
        </div>
      </div>
    </div>
  </section>

</main>

<Footer />


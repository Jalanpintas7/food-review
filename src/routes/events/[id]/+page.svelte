<script>
  import { page } from '$app/stores';
  import Header from '$lib/components/Header.svelte';
  import FoodNavigation from '$lib/components/NavigationMenu.svelte';
  import TrendingSidebar from '$lib/components/Sidebar.svelte';
  import Footer from '$lib/components/Footer.svelte';

  // Data artikel events berdasarkan ID
  const eventsData = {
    1: {
      id: 1,
      title: 'George Town Festival 2024 - Festival Seni dan Budaya Terbesar',
      category: 'EVENTS',
      author: 'OMNY',
      date: 'APRIL 26, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">G</span>
          eorge Town Festival adalah festival seni dan budaya terbesar di Kelantan yang diadakan setiap tahun. Festival ini menampilkan berbagai pertunjukan seni, musik, teater, dan pameran yang mencerminkan keragaman budaya Malaysia.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop'
    }
  };

  // Ambil ID dari URL
  $: articleId = $page.params.id;
  $: article = eventsData[articleId] || eventsData[1];
</script>

<svelte:head>
  <title>{article.title} - Kelantan Food</title>
  <meta name="description" content="Read the full article: {article.title}" />
</svelte:head>

<Header />
<FoodNavigation />

<main class="bg-gray-50 min-h-screen">
  <div class="container mx-auto px-4 py-8">
    <!-- Breadcrumb -->
    <nav class="mb-6">
      <ol class="flex items-center space-x-2 text-sm text-gray-600">
        <li><a href="/" class="hover:text-primary-500 transition-colors">Home</a></li>
        <li class="text-gray-400">/</li>
        <li><a href="/events" class="hover:text-primary-500 transition-colors">Events</a></li>
        <li class="text-gray-400">/</li>
        <li class="text-gray-800 font-medium">{article.title}</li>
      </ol>
    </nav>
    
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
      <!-- Main Content -->
      <div class="lg:col-span-2">
        <article class="bg-white rounded-lg shadow-sm p-8">
          <!-- Article Header -->
          <header class="mb-8">
            <h1 class="text-3xl lg:text-4xl font-bold text-gray-800 mb-4 leading-tight">
              {article.title}
            </h1>
            
            <!-- Article Meta -->
            <div class="flex items-center space-x-4 text-sm text-gray-600">
              <span class="font-medium">BY {article.author}</span>
              <span class="text-gray-400">•</span>
              <span>{article.date}</span>
              <span class="text-gray-400">•</span>
              <span class="tag">{article.category}</span>
            </div>
          </header>

          <!-- Main Image -->
          <div class="mb-8">
            <img 
              src={article.mainImage} 
              alt={article.title}
              class="w-full h-96 object-cover rounded-lg shadow-md"
            />
          </div>

          <!-- Article Content -->
          <div class="prose prose-lg max-w-none">
            {@html article.content}
            
            <!-- Back to Articles Button -->
            <div class="mt-12 pt-8 border-t border-gray-200">
              <a 
                href="/events" 
                class="inline-flex items-center gap-2 bg-primary-500 hover:bg-primary-600 text-white px-6 py-3 rounded-lg font-medium transition-colors"
              >
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                </svg>
                <span>Back to Articles</span>
              </a>
            </div>
          </div>
        </article>
      </div>
      
      <!-- Sidebar -->
      <div class="lg:col-span-1">
        <TrendingSidebar />
      </div>
    </div>
  </div>
</main>

<Footer />

<style>
  .tag {
    @apply bg-primary-100 text-primary-600 px-3 py-1 rounded-full text-xs font-medium;
  }
  
  .prose {
    @apply text-gray-700;
  }
  
  .prose p {
    @apply mb-6 text-lg leading-relaxed;
  }
  
  .prose h2 {
    @apply text-2xl font-bold text-gray-800 mb-4 mt-8;
  }
</style>

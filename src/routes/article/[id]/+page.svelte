<script>
  import { page } from '$app/stores';
  import Header from '$lib/components/Header.svelte';
  import FoodNavigation from '$lib/components/NavigationMenu.svelte';
  import TrendingSidebar from '$lib/components/Sidebar.svelte';
  import Footer from '$lib/components/Footer.svelte';

  // Data artikel berdasarkan ID
  const articleData = {
    1: {
      id: 1,
      title: 'Nasi Lemak Terbaik di Kelantan - 10 Tempat Wajib Coba',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 26, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">N</span>
          asi Lemak adalah hidangan nasional Malaysia yang terdiri dari nasi yang dimasak dengan santan, disajikan dengan berbagai lauk pauk seperti ayam goreng, telur, kacang, dan sambal. Di Kelantan, hidangan ini memiliki cita rasa yang unik dan berbeda dari daerah lain.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Setelah melakukan riset mendalam dan mencoba puluhan tempat makan di Kelantan, kami telah mengumpulkan 10 tempat terbaik untuk menikmati Nasi Lemak. Setiap tempat memiliki keunikan tersendiri dalam hal cita rasa, tekstur, dan cara penyajian.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">1. Nasi Lemak Ali - Georgetown</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Terletak di jantung Georgetown, Nasi Lemak Ali telah melayani pelanggan setia selama lebih dari 30 tahun. Yang membuat tempat ini istimewa adalah sambal mereka yang pedas namun seimbang, serta ayam goreng yang renyah di luar dan lembut di dalam.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Harga yang terjangkau dan porsi yang besar membuat tempat ini favorit para pekerja kantor dan mahasiswa. Jangan lupa untuk datang pagi-pagi karena mereka sering kehabisan stok sebelum jam 10 pagi.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop'
    },
    2: {
      id: 2,
      title: 'Char Kway Teow Legendaris - Warisan Kuliner Kelantan',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 25, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">C</span>
          har Kway Teow adalah hidangan mie goreng khas Kelantan yang telah menjadi ikon kuliner Malaysia. Mie pipih yang digoreng dengan api besar bersama udang, kerang, tauge, dan telur, menciptakan cita rasa yang tak terlupakan.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Rahasia Char Kway Teow yang autentik terletak pada teknik memasak dengan wok yang sangat panas dan penggunaan kecap manis yang tepat. Setiap gerakan sang koki dalam menggoreng mie adalah seni yang telah diturunkan dari generasi ke generasi.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">Warisan Keluarga di Lorong Selamat</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Lorong Selamat adalah tempat legendaris untuk Char Kway Teow di Kelantan. Di sini, Anda akan menemukan beberapa warung makan yang telah beroperasi selama puluhan tahun, masing-masing dengan resep rahasia keluarga mereka sendiri.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=400&h=300&fit=crop'
    },
    3: {
      id: 3,
      title: 'Mee Goreng Mamak - Resep Rahasia yang Bikin Ketagihan',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 24, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">M</span>
          ee Goreng Mamak adalah hidangan mie goreng khas India-Muslim Malaysia yang telah menjadi favorit semua kalangan. Dengan bumbu rempah yang kaya dan teknik memasak yang unik, hidangan ini menawarkan pengalaman kuliner yang tak terlupakan.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Yang membedakan Mee Goreng Mamak dari mie goreng lainnya adalah penggunaan bumbu kari, cabai, dan rempah-rempah yang memberikan cita rasa pedas dan gurih yang seimbang. Setiap warung makan memiliki resep rahasia mereka sendiri.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">Teknik Memasak yang Unik</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Proses memasak Mee Goreng Mamak membutuhkan keterampilan khusus. Mie harus digoreng dengan api besar dalam wok yang sangat panas, sambil terus diaduk agar tidak lengket dan matang merata. Penambahan bumbu dilakukan secara bertahap untuk memastikan setiap rempah terasa sempurna.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1563379091339-03246963d4a9?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400&h=300&fit=crop'
    },
    4: {
      id: 4,
      title: 'Laksa Kelantan - Kuah Kental yang Menggugah Selera',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 23, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">L</span>
          aksa Kelantan adalah hidangan mie kuah kental yang menjadi kebanggaan kuliner Kelantan. Berbeda dengan laksa di daerah lain, Laksa Kelantan menggunakan kuah asam yang terbuat dari ikan, dengan tambahan santan yang memberikan kekentalan dan cita rasa yang unik.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Kombinasi rasa asam, pedas, dan gurih membuat Laksa Kelantan menjadi hidangan yang menggugah selera. Setiap warung makan memiliki resep rahasia untuk kuah mereka, yang biasanya diturunkan dari generasi ke generasi.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">Bahan-Bahan Tradisional</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Bahan utama Laksa Kelantan adalah ikan kembung yang direbus dan dihaluskan untuk membuat kuah. Ditambahkan pula asam jawa, cabai, bawang merah, dan rempah-rempah lainnya. Mie yang digunakan adalah mie beras yang lembut dan kenyal.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop'
    },
    5: {
      id: 5,
      title: 'Roti Canai - Sarapan Favorit Masyarakat Malaysia',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 22, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">R</span>
          oti Canai adalah roti pipih yang digoreng dengan minyak, biasanya disajikan dengan kari atau dal. Hidangan ini adalah sarapan favorit masyarakat Malaysia dan dapat ditemukan di hampir setiap warung makan Mamak di Kelantan.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Teknik membuat Roti Canai membutuhkan keterampilan khusus. Adonan harus diregangkan dan dilipat berulang kali untuk menciptakan lapisan-lapisan tipis yang akan memberikan tekstur yang renyah dan lembut saat digoreng.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">Variasi Roti Canai</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Selain Roti Canai klasik, ada berbagai variasi yang dapat Anda coba, seperti Roti Canai dengan telur, Roti Canai dengan pisang, atau Roti Canai dengan keju. Setiap variasi menawarkan cita rasa yang berbeda dan unik.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop'
    },
    6: {
      id: 6,
      title: 'Satay Ayam - Sate dengan Bumbu Kacang yang Nikmat',
      category: 'FOOD',
      author: 'OMNY',
      date: 'APRIL 21, 2023',
      content: `
        <p class="mb-6 text-lg leading-relaxed">
          <span class="text-4xl font-serif text-primary-500 float-left mr-3 mt-1">S</span>
          atay Ayam adalah hidangan daging ayam yang ditusuk dengan tusuk sate dan dipanggang, disajikan dengan bumbu kacang yang kental dan nikmat. Hidangan ini adalah salah satu street food paling populer di Kelantan.
        </p>
        
        <p class="mb-6 text-lg leading-relaxed">
          Rahasia Satay Ayam yang lezat terletak pada marinasi daging dan bumbu kacang yang dibuat dengan resep rahasia. Daging ayam harus dimarinasi dengan bumbu rempah selama beberapa jam sebelum dipanggang untuk memberikan cita rasa yang mendalam.
        </p>

        <h2 class="text-2xl font-bold text-gray-800 mb-4 mt-8">Bumbu Kacang yang Sempurna</h2>
        
        <p class="mb-6 text-lg leading-relaxed">
          Bumbu kacang untuk Satay Ayam dibuat dari kacang tanah yang digoreng dan dihaluskan, dicampur dengan cabai, bawang merah, bawang putih, dan rempah-rempah lainnya. Hasilnya adalah saus yang kental, gurih, dan sedikit pedas yang melengkapi daging ayam dengan sempurna.
        </p>
      `,
      mainImage: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800&h=500&fit=crop',
      embeddedImage1: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
      embeddedImage2: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=300&fit=crop'
    }
  };

  // Ambil ID dari URL
  $: articleId = $page.params.id;
  $: article = articleData[articleId] || articleData[1];
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
        <li><a href="/food" class="hover:text-primary-500 transition-colors">Food</a></li>
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
            
            <!-- Social Share Icons -->
            <div class="flex items-center space-x-4 mb-4">
              <button class="w-10 h-10 bg-black rounded-full flex items-center justify-center hover:bg-gray-800 transition-colors">
                <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
                </svg>
              </button>
              <button class="w-10 h-10 bg-primary-500 rounded-full flex items-center justify-center hover:bg-primary-600 transition-colors">
                <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>
                </svg>
              </button>
              <button class="w-10 h-10 bg-gray-400 rounded-full flex items-center justify-center hover:bg-gray-500 transition-colors">
                <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm5.894 8.221l-1.97 9.28c-.145.658-.537.818-1.084.508l-3-2.21-1.446 1.394c-.14.18-.357.295-.6.295-.002 0-.003 0-.005 0l.213-3.054 5.56-5.022c.24-.213-.054-.334-.373-.121l-6.869 4.326-2.96-.924c-.64-.203-.658-.64.135-.954l11.566-4.458c.538-.196 1.006.128.832.941z"/>
                </svg>
              </button>
              <button class="w-10 h-10 bg-gray-400 rounded-full flex items-center justify-center hover:bg-gray-500 transition-colors">
                <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                </svg>
              </button>
            </div>
            
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
            
            
            
            <!-- Embedded Image 1 -->
            <div class="my-8">
              <img 
                src={article.embeddedImage1} 
                alt="Food preparation"
                class="w-full h-64 object-cover rounded-lg shadow-md"
              />
            </div>
            
            <p class="mb-6 text-lg leading-relaxed">
              Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
            </p>
            
            <p class="mb-6 text-lg leading-relaxed">
              Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.
            </p>
            
            <!-- Embedded Image 2 -->
            <div class="my-8">
              <img 
                src={article.embeddedImage2} 
                alt="Plated meal"
                class="w-full h-64 object-cover rounded-lg shadow-md"
              />
            </div>
            
            <p class="mb-6 text-lg leading-relaxed">
              At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
            </p>
            
            <p class="mb-6 text-lg leading-relaxed">
              Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.
            </p>
          </div>

          <!-- Back to Articles Button -->
          <div class="mt-12 pt-8 border-t border-gray-200">
            <a 
              href="/food" 
              class="inline-flex items-center gap-2 bg-primary-500 hover:bg-primary-600 text-white px-6 py-3 rounded-lg font-medium transition-colors"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
              </svg>
              <span>Back to Articles</span>
            </a>
          </div>
        </article>
        
        <!-- Related Articles -->
        <section class="mt-12">
          <h2 class="text-2xl font-bold text-gray-800 mb-6">Related Articles</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            {#each Object.values(articleData).filter(a => a.id !== article.id).slice(0, 4) as relatedArticle}
              <article class="bg-white rounded-lg shadow-sm overflow-hidden hover:shadow-md transition-shadow">
                <a href="/article/{relatedArticle.id}" class="block">
                  <img 
                    src={relatedArticle.mainImage} 
                    alt={relatedArticle.title}
                    class="w-full h-32 object-cover hover:opacity-90 transition-opacity"
                  />
                  <div class="p-3">
                    <h3 class="text-base font-semibold text-gray-800 mb-1 hover:text-primary-600 transition-colors line-clamp-2">
                      {relatedArticle.title}
                    </h3>
                    <div class="flex items-center text-xs text-gray-600 mb-1">
                      <span>{relatedArticle.author}</span>
                      <span class="mx-2">•</span>
                      <span>{relatedArticle.date}</span>
                    </div>
                    <span class="text-primary-500 text-xs font-medium">Read More →</span>
                  </div>
                </a>
              </article>
            {/each}
          </div>
        </section>
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
  
  .line-clamp-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
</style>

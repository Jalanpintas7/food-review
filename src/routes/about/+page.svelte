<script>
  import Header from "$lib/components/Header.svelte";
  import NavigationMenu from "$lib/components/NavigationMenu.svelte";
  import Footer from "$lib/components/Footer.svelte";
  import PageHeader from "$lib/components/PageHeader.svelte";
</script>

<svelte:head>
  <title>About Us - Kelantan Food Review</title>
  <meta
    name="description"
    content="Tentang Kelantan Food Review - Panduan lengkap untuk review makanan, resep, dan pengalaman kuliner terbaik di Kelantan."
  />
</svelte:head>

<Header />
<NavigationMenu />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Tentang Kami"
    description="Kelantan Foodie is founded in April 2016. We want to be best food review and editorial publishing site in Kelantan. A food site in Kelantan that covers food review, the new cafe in Kelantan and trending food editorials. We are a group of Kelantanites, that love Kelantan so much, especially Kelantan FOOD. And so, we set our own quest to share our little footage in discovering and exploring foods in Kelantan. It's no secret that Kelantan – being a small island it is – is known as food heaven. But where do you find the best and the most try-worthy Kelantan food? Fret not, we got you covered!"
  />

  <!-- Main Content -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50">
    <div class="container mx-auto px-4">

    <!-- Main Content -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 mb-20">
      <!-- About Content -->
      <div class="space-y-8">
        <div class="bg-white p-8 rounded-2xl shadow-xl border border-gray-100 transform hover:scale-105 transition-all duration-300">
          <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
            Cerita Kami
          </h2>
          <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
          <div class="space-y-4">
            <p class="text-gray-600 leading-relaxed">
              Kelantan Food Review lahir dari kecintaan kami terhadap kuliner
              Malaysia, khususnya hidangan-hidangan lezat yang ada di Kelantan. Sejak
              2020, kami telah berkomitmen untuk memberikan review yang jujur,
              informatif, dan membantu bagi para pecinta makanan.
            </p>
            <p class="text-gray-600 leading-relaxed">
              Tim kami terdiri dari food blogger berpengalaman, chef lokal, dan
              pecinta kuliner yang memiliki passion untuk mengeksplorasi setiap
              sudut kuliner Kelantan. Kami percaya bahwa setiap hidangan memiliki
              cerita unik yang layak untuk dibagikan.
            </p>
            <p class="text-gray-600 leading-relaxed">
              Dari warung kaki lima hingga restoran mewah, dari resep tradisional
              hingga inovasi modern, kami hadir untuk menjadi panduan terpercaya
              Anda dalam menjelajahi dunia kuliner Kelantan.
            </p>
          </div>
        </div>
      </div>

      <!-- Image -->
      <div class="relative group">
        <div class="absolute inset-0 bg-gradient-to-br from-red-600/20 to-orange-500/20 rounded-2xl transform rotate-3 group-hover:rotate-6 transition-transform duration-300"></div>
        <img
          src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=400&fit=crop"
          alt="Tim Kelantan Food Review"
          class="w-full h-96 object-cover rounded-2xl shadow-2xl transform -rotate-3 group-hover:-rotate-6 transition-transform duration-300"
        />
        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent rounded-2xl"></div>
        <div class="absolute bottom-6 left-6 text-white">
          <h3 class="text-xl font-bold mb-2">Tim Kelantan Food Review</h3>
          <p class="text-sm opacity-90">Passionate Food Explorers</p>
        </div>
      </div>
    </div>

    <!-- Mission & Vision -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-20">
      <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
        <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mb-6 shadow-lg">
          <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
          </svg>
        </div>
        <h3 class="text-2xl font-bold text-gray-800 mb-3">Misi Kami</h3>
        <div class="w-16 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
        <p class="text-gray-600 leading-relaxed">
          Menjadi platform terpercaya yang menghubungkan pecinta kuliner dengan
          pengalaman makan terbaik di Kelantan, sambil melestarikan dan
          mempromosikan kekayaan kuliner Malaysia.
        </p>
      </div>

      <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl shadow-xl border border-orange-100 transform hover:scale-105 transition-all duration-300">
        <div class="w-20 h-20 bg-gradient-to-br from-orange-600 to-red-600 rounded-2xl flex items-center justify-center mb-6 shadow-lg">
          <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
          </svg>
        </div>
        <h3 class="text-2xl font-bold text-gray-800 mb-3">Visi Kami</h3>
        <div class="w-16 h-1 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-6"></div>
        <p class="text-gray-600 leading-relaxed">
          Menjadi komunitas kuliner terbesar di Malaysia yang menginspirasi dan
          memberdayakan setiap orang untuk mengeksplorasi, mencoba, dan
          mencintai kuliner lokal.
        </p>
      </div>
    </div>

    <!-- Values -->
    <div class="bg-gradient-to-br from-white to-gray-50 p-10 rounded-3xl shadow-2xl border border-gray-100 mb-20">
      <div class="text-center mb-12">
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Nilai-Nilai Kami
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-2xl mx-auto">Prinsip-prinsip yang memandu setiap langkah kami dalam memberikan pengalaman kuliner terbaik</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="text-center group">
          <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg transform group-hover:scale-110 transition-transform duration-300">
            <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Passion</h3>
          <p class="text-gray-600 leading-relaxed">
            Kecintaan mendalam terhadap kuliner yang mendorong kami untuk terus
            mengeksplorasi dan berbagi
          </p>
        </div>

        <div class="text-center group">
          <div class="w-20 h-20 bg-gradient-to-br from-orange-600 to-red-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg transform group-hover:scale-110 transition-transform duration-300">
            <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Integritas</h3>
          <p class="text-gray-600 leading-relaxed">
            Review yang jujur dan objektif berdasarkan pengalaman nyata tanpa
            bias
          </p>
        </div>

        <div class="text-center group">
          <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-orange-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg transform group-hover:scale-110 transition-transform duration-300">
            <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Komunitas</h3>
          <p class="text-gray-600 leading-relaxed">
            Membangun komunitas pecinta kuliner yang saling mendukung dan
            berbagi
          </p>
        </div>
      </div>
    </div>

    <!-- Team -->
    <div class="text-center mb-20">
      <div class="mb-12">
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Tim Kami
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-3xl mx-auto text-lg leading-relaxed">
          Tim kami terdiri dari food blogger berpengalaman, chef lokal, dan
          pecinta kuliner yang berdedikasi untuk memberikan konten berkualitas
          tinggi
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="text-center group">
          <div class="relative mb-6">
            <div class="absolute inset-0 bg-gradient-to-br from-red-600/20 to-orange-500/20 rounded-full transform rotate-3 group-hover:rotate-6 transition-transform duration-300"></div>
            <img
              src="https://images.unsplash.com/photo-1494790108755-2616b612b786?w=200&h=200&fit=crop&crop=face"
              alt="Sarah Chen"
              class="w-28 h-28 rounded-full mx-auto object-cover shadow-xl transform -rotate-3 group-hover:-rotate-6 transition-transform duration-300"
            />
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-2">Sarah Chen</h3>
          <p class="text-gray-600 font-medium">Founder & Food Blogger</p>
        </div>

        <div class="text-center group">
          <div class="relative mb-6">
            <div class="absolute inset-0 bg-gradient-to-br from-orange-500/20 to-red-600/20 rounded-full transform -rotate-3 group-hover:-rotate-6 transition-transform duration-300"></div>
            <img
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop&crop=face"
              alt="Ahmad Rahman"
              class="w-28 h-28 rounded-full mx-auto object-cover shadow-xl transform rotate-3 group-hover:rotate-6 transition-transform duration-300"
            />
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-2">Ahmad Rahman</h3>
          <p class="text-gray-600 font-medium">Chef & Culinary Expert</p>
        </div>

        <div class="text-center group">
          <div class="relative mb-6">
            <div class="absolute inset-0 bg-gradient-to-br from-red-600/20 to-orange-500/20 rounded-full transform rotate-3 group-hover:rotate-6 transition-transform duration-300"></div>
            <img
              src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop&crop=face"
              alt="Lisa Wong"
              class="w-28 h-28 rounded-full mx-auto object-cover shadow-xl transform -rotate-3 group-hover:-rotate-6 transition-transform duration-300"
            />
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-2">Lisa Wong</h3>
          <p class="text-gray-600 font-medium">Content Creator</p>
        </div>
      </div>
    </div>

    <!-- Key Stats -->
    <div class="mb-16">
      <div class="text-center mb-12">
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Key Stats
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 text-lg">Pencapaian Kami dalam Angka</p>
      </div>
        
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-red-100">
          <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
            <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 24 24">
              <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
            </svg>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-3">Facebook Monthly Reach</h3>
          <p class="text-4xl font-black bg-gradient-to-r from-red-600 to-red-700 bg-clip-text text-transparent mb-2">35M+</p>
          <p class="text-xs text-gray-500 font-medium">JUTAAN REACH</p>
        </div>

        <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-orange-100">
          <div class="w-20 h-20 bg-gradient-to-br from-orange-600 to-red-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
            <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 24 24">
              <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
            </svg>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-3">Facebook Video Views</h3>
          <p class="text-4xl font-black bg-gradient-to-r from-orange-600 to-red-600 bg-clip-text text-transparent mb-2">20M+</p>
          <p class="text-xs text-gray-500 font-medium">JUTAAN VIEWS</p>
        </div>

        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-red-100">
          <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
            <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 24 24">
              <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
            </svg>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-3">Facebook Followers</h3>
          <p class="text-4xl font-black bg-gradient-to-r from-red-600 to-red-700 bg-clip-text text-transparent mb-2">1M+</p>
          <p class="text-xs text-gray-500 font-medium">FOLLOWERS</p>
        </div>

        <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-orange-100">
          <div class="w-20 h-20 bg-gradient-to-br from-orange-600 to-red-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
            <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"/>
            </svg>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-3">Website Traffic</h3>
          <p class="text-4xl font-black bg-gradient-to-r from-orange-600 to-red-600 bg-clip-text text-transparent mb-2">2M+</p>
          <p class="text-xs text-gray-500 font-medium">MONTHLY VISITORS</p>
        </div>

        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-red-100">
          <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
            <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
            </svg>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-3">Instagram Followers</h3>
          <p class="text-4xl font-black bg-gradient-to-r from-red-600 to-red-700 bg-clip-text text-transparent mb-2">319K+</p>
          <p class="text-xs text-gray-500 font-medium">FOLLOWERS</p>
        </div>
      </div>
      
      <div class="text-center mt-12">
        <div class="inline-flex items-center bg-gradient-to-r from-red-100 to-orange-100 px-8 py-4 rounded-full border-2 border-red-300 shadow-xl">
          <div class="w-4 h-4 bg-gradient-to-r from-red-600 to-orange-600 rounded-full mr-4 animate-pulse shadow-sm"></div>
          <p class="text-red-800 text-lg font-bold">Last updated on 25/7/2020</p>
        </div>
      </div>
    </div>
  </div>
</main>

<Footer />

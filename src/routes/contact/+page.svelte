<script>
  import Header from '$lib/components/Header.svelte';
  import NavigationMenu from '$lib/components/NavigationMenu.svelte';
  import Footer from '$lib/components/Footer.svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';
  
  let formData = {
    name: '',
    email: '',
    subject: '',
    message: ''
  };
  
  function handleSubmit() {
    // Handle form submission
    console.log('Form submitted:', formData);
    // Reset form
    formData = {
      name: '',
      email: '',
      subject: '',
      message: ''
    };
  }
</script>

<svelte:head>
  <title>Contact Us - Kelantan Food Review</title>
  <meta name="description" content="Hubungi Kelantan Food Review untuk pertanyaan, saran, atau kolaborasi. Kami siap membantu Anda." />
</svelte:head>

<Header />
<NavigationMenu />

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  <PageHeader 
    title="Hubungi Kami"
    description="Punya pertanyaan, saran, atau ingin berkolaborasi? Kami siap membantu Anda! Tim kami akan merespons dalam 24-48 jam kerja."
    icon="mail"
  />

  <!-- Main Content -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50">
    <div class="container mx-auto px-4">

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 mb-20">
      <!-- Contact Form -->
      <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
        <div class="flex items-center mb-6">
          <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
            </svg>
          </div>
          <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent">
            Kirim Pesan
          </h2>
        </div>
        <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-8"></div>
        
        <form on:submit|preventDefault={handleSubmit} class="space-y-6">
          <div class="group">
            <label for="name" class="block text-sm font-semibold text-gray-700 mb-2 group-hover:text-red-600 transition-colors">
              Nama Lengkap *
            </label>
            <input
              type="text"
              id="name"
              bind:value={formData.name}
              required
              class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all duration-300 bg-white/80 backdrop-blur-sm"
              placeholder="Masukkan nama lengkap Anda"
            />
          </div>

          <div class="group">
            <label for="email" class="block text-sm font-semibold text-gray-700 mb-2 group-hover:text-red-600 transition-colors">
              Email *
            </label>
            <input
              type="email"
              id="email"
              bind:value={formData.email}
              required
              class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all duration-300 bg-white/80 backdrop-blur-sm"
              placeholder="contoh@email.com"
            />
          </div>

          <div class="group">
            <label for="subject" class="block text-sm font-semibold text-gray-700 mb-2 group-hover:text-red-600 transition-colors">
              Subjek *
            </label>
            <select
              id="subject"
              bind:value={formData.subject}
              required
              class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all duration-300 bg-white/80 backdrop-blur-sm"
            >
              <option value="">Pilih subjek</option>
              <option value="general">Pertanyaan Umum</option>
              <option value="review">Saran Review</option>
              <option value="collaboration">Kolaborasi</option>
              <option value="advertising">Iklan</option>
              <option value="technical">Masalah Teknis</option>
              <option value="other">Lainnya</option>
            </select>
          </div>

          <div class="group">
            <label for="message" class="block text-sm font-semibold text-gray-700 mb-2 group-hover:text-red-600 transition-colors">
              Pesan *
            </label>
            <textarea
              id="message"
              bind:value={formData.message}
              required
              rows="6"
              class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all duration-300 bg-white/80 backdrop-blur-sm resize-none"
              placeholder="Tulis pesan Anda di sini..."
            ></textarea>
          </div>

          <button
            type="submit"
            class="w-full bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 text-white font-bold py-4 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl"
          >
            <span class="flex items-center justify-center">
              <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
              </svg>
              Kirim Pesan
            </span>
          </button>
        </form>
      </div>

      <!-- Contact Information -->
      <div class="space-y-8">
        <!-- General Info -->
        <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl shadow-xl border border-orange-100 transform hover:scale-105 transition-all duration-300">
          <div class="flex items-center mb-6">
            <div class="w-12 h-12 bg-gradient-to-br from-orange-600 to-red-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
              <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
              </svg>
            </div>
            <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-orange-600 bg-clip-text text-transparent">
              Informasi Kontak
            </h2>
          </div>
          <div class="w-20 h-1 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-8"></div>
          
          <div class="space-y-6">
            <div class="flex items-start space-x-4 group">
              <div class="w-12 h-12 bg-gradient-to-br from-red-100 to-orange-100 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-bold text-gray-800 mb-1 group-hover:text-red-600 transition-colors">Alamat</h3>
                <p class="text-gray-600 leading-relaxed">
                  Jalan Kelantan, Georgetown<br>
                  Kelantan, Malaysia 10000
                </p>
              </div>
            </div>

            <div class="flex items-start space-x-4 group">
              <div class="w-12 h-12 bg-gradient-to-br from-orange-100 to-red-100 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-bold text-gray-800 mb-1 group-hover:text-orange-600 transition-colors">Telepon</h3>
                <p class="text-gray-600 leading-relaxed">
                  +60 4-123 4567<br>
                  +60 12-345 6789
                </p>
              </div>
            </div>

            <div class="flex items-start space-x-4 group">
              <div class="w-12 h-12 bg-gradient-to-br from-red-100 to-orange-100 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-bold text-gray-800 mb-1 group-hover:text-red-600 transition-colors">Email</h3>
                <p class="text-gray-600 leading-relaxed">
                  info@kelantanfood.com<br>
                  hello@kelantanfood.com
                </p>
              </div>
            </div>

            <div class="flex items-start space-x-4 group">
              <div class="w-12 h-12 bg-gradient-to-br from-orange-100 to-red-100 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-bold text-gray-800 mb-1 group-hover:text-orange-600 transition-colors">Jam Kerja</h3>
                <p class="text-gray-600 leading-relaxed">
                  Senin - Jumat: 9:00 AM - 6:00 PM<br>
                  Sabtu: 10:00 AM - 4:00 PM<br>
                  Minggu: Tutup
                </p>
              </div>
            </div>
          </div>
        </div>

        <!-- Social Media -->
        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
          <div class="flex items-center mb-6">
            <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
              <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
              </svg>
            </div>
            <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent">
              Ikuti Kami
            </h2>
          </div>
          <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
          <p class="text-gray-600 mb-6 leading-relaxed">
            Ikuti kami di media sosial untuk mendapatkan update terbaru tentang review makanan, resep, dan acara kuliner.
          </p>
          
          <div class="grid grid-cols-2 gap-4">
            <a href="#" class="flex items-center space-x-3 p-4 bg-gradient-to-r from-blue-50 to-blue-100 rounded-xl hover:from-blue-100 hover:to-blue-200 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
              <svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
              </svg>
              <span class="font-bold text-gray-800">Twitter</span>
            </a>

            <a href="#" class="flex items-center space-x-3 p-4 bg-gradient-to-r from-pink-50 to-pink-100 rounded-xl hover:from-pink-100 hover:to-pink-200 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
              <svg class="w-6 h-6 text-pink-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>
              </svg>
              <span class="font-bold text-gray-800">Pinterest</span>
            </a>

            <a href="#" class="flex items-center space-x-3 p-4 bg-gradient-to-r from-red-50 to-red-100 rounded-xl hover:from-red-100 hover:to-red-200 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
              <svg class="w-6 h-6 text-red-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
              </svg>
              <span class="font-bold text-gray-800">YouTube</span>
            </a>

            <a href="#" class="flex items-center space-x-3 p-4 bg-gradient-to-r from-green-50 to-green-100 rounded-xl hover:from-green-100 hover:to-green-200 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
              <svg class="w-6 h-6 text-green-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>
              </svg>
              <span class="font-bold text-gray-800">Instagram</span>
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- FAQ Section -->
    <div class="bg-gradient-to-br from-white to-gray-50 p-10 rounded-3xl shadow-2xl border border-gray-100 mb-20">
      <div class="text-center mb-12">
        <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Pertanyaan Umum
        </h2>
        <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-2xl mx-auto text-lg leading-relaxed">
          Jawaban untuk pertanyaan yang sering diajukan oleh pengunjung kami
        </p>
      </div>
      
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 transform hover:scale-105 transition-all duration-300">
          <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mb-4 shadow-lg">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Bagaimana cara submit review restoran?</h3>
          <p class="text-gray-600 leading-relaxed">
            Anda dapat mengirimkan review melalui form kontak di atas atau email kami langsung. Tim kami akan menghubungi Anda untuk langkah selanjutnya.
          </p>
        </div>

        <div class="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 transform hover:scale-105 transition-all duration-300">
          <div class="w-12 h-12 bg-gradient-to-br from-orange-600 to-red-600 rounded-xl flex items-center justify-center mb-4 shadow-lg">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Apakah Anda menerima kolaborasi?</h3>
          <p class="text-gray-600 leading-relaxed">
            Ya, kami terbuka untuk berbagai jenis kolaborasi. Silakan hubungi kami untuk membicarakan detail lebih lanjut.
          </p>
        </div>

        <div class="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 transform hover:scale-105 transition-all duration-300">
          <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-orange-600 rounded-xl flex items-center justify-center mb-4 shadow-lg">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-gray-800 mb-3">Berapa lama waktu respons email?</h3>
          <p class="text-gray-600 leading-relaxed">
            Kami biasanya merespons dalam 24-48 jam kerja. Untuk pertanyaan mendesak, silakan hubungi kami via telepon.
          </p>
        </div>
      </div>
    </div>

    <!-- Map Section -->
    <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 mb-20">
      <div class="text-center mb-8">
        <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
          Lokasi Kami
        </h2>
        <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
        <p class="text-gray-600 max-w-2xl mx-auto">
          Kunjungi kantor kami di Georgetown, Kelantan untuk bertemu langsung dengan tim kami
        </p>
      </div>
      
      <div class="relative h-96 rounded-2xl overflow-hidden shadow-2xl">
        <div class="absolute inset-0 bg-gradient-to-br from-red-600/10 to-orange-500/10 z-10"></div>
        <iframe 
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8199999999997!2d100.3354!3d5.4164!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac3c49ce76e31%3A0xfccd80681e2ab7d0!2sGeorgetown%2C%20Kelantan%2C%20Malaysia!5e0!3m2!1sen!2sid!4v1234567890"
          width="100%" 
          height="100%" 
          style="border:0;" 
          allowfullscreen="" 
          loading="lazy" 
          referrerpolicy="no-referrer-when-downgrade"
          class="relative z-0"
        ></iframe>
      </div>
    </div>
  </div>
</main>

<Footer />

<script>
  export let title = "Tentang Kuliner Kelantan";
  export let description1 = "Kelantan dikenal sebagai \"Pearl of the Orient\" dan merupakan surga kuliner Malaysia. Makanan di sini adalah perpaduan sempurna dari budaya Melayu, Cina, India, dan Peranakan.";
  export let description2 = "Dari street food legendaris hingga restoran fine dining, setiap hidangan memiliki cerita dan cita rasa yang unik yang mencerminkan keragaman budaya Kelantan.";
  export let tipsTitle = "Tips Makan";
  export let tipsContent = "Coba makanan di pagi hari untuk mendapatkan rasa terbaik. Street food di Kelantan biasanya lebih segar dan lezat di pagi hari.";
  export let icon = "🍽️";
</script>

<div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
  <div class="flex items-center mb-6">
    <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
      <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
      </svg>
    </div>
    <h2 class="text-2xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent">
      {title}
    </h2>
  </div>
  <div class="w-16 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
  <div class="space-y-4">
    <p class="text-gray-600 text-sm leading-relaxed">
      {description1}
    </p>
    <p class="text-gray-600 text-sm leading-relaxed">
      {description2}
    </p>
    <div class="bg-gradient-to-r from-red-100 to-orange-100 p-4 rounded-xl border border-red-200">
      <h3 class="font-semibold text-red-800 mb-2 flex items-center">
        <span class="text-xl mr-2">{icon}</span>
        {tipsTitle}
      </h3>
      <p class="text-red-700 text-sm">
        {tipsContent}
      </p>
    </div>
  </div>
</div>

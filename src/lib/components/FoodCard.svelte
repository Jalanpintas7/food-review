<script>
  export let article = {
    id: '',
    title: '',
    description: '',
    image: '',
    category: '',
    author: '',
    date: ''
  };

  export let websiteSlug = '';
</script>

<article class="bg-gradient-to-br from-white to-red-50 rounded-2xl shadow-xl border border-red-100 overflow-hidden hover:shadow-2xl hover:scale-[1.02] transition-all duration-300 transform h-full flex flex-col">
  <div class="flex flex-col md:flex-row h-full flex-1">
    <!-- Image -->
    <div class="md:w-1/3 relative group flex-shrink-0 h-48 md:h-full">
      <a href="/{websiteSlug}/article/{article.id}" class="block h-full">
        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 z-10"></div>
        <img 
          src={article.image} 
          alt={article.title}
          class="w-full h-48 md:h-full object-cover group-hover:scale-110 transition-transform duration-300"
          style="aspect-ratio: 4/3;"
        />
      </a>
    </div>
    
    <!-- Content -->
    <div class="md:w-2/3 p-8 flex flex-col justify-between h-full flex-1">
      <div class="flex items-center space-x-4 text-sm text-gray-500 mb-4">
        <span class="bg-gradient-to-r from-orange-100 to-red-100 text-orange-600 px-3 py-1 rounded-full text-xs font-semibold border border-orange-200">
          {article.category}
        </span>
        <span class="flex items-center">
          <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
          </svg>
          {article.author}
        </span>
        <span class="flex items-center">
          <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
          </svg>
          {article.date}
        </span>
      </div>
      
      <h2 class="text-2xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4 hover:text-red-600 transition-colors flex items-start">
        <a href="/{websiteSlug}/article/{article.id}" class="block line-clamp-2">
          {article.title}
        </a>
      </h2>
      
      <div class="flex-grow flex items-start">
        <p class="text-gray-600 leading-relaxed line-clamp-3">
          {article.description}
        </p>
      </div>
      
      <div class="mt-6 flex-shrink-0">
        <a 
          href="/{websiteSlug}/article/{article.id}" 
          class="inline-flex items-center gap-2 bg-gradient-to-r from-red-600 to-orange-600 hover:from-red-700 hover:to-orange-700 text-white px-6 py-3 rounded-xl font-semibold text-sm transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl"
        >
          <span>BACA SELENGKAPNYA</span>
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
          </svg>
        </a>
      </div>
    </div>
  </div>
</article>
<script>
  import { page } from '$app/stores';
  import { onMount } from 'svelte';
  import { browser } from '$app/environment';
  const foodCategories = [
    { name: 'Home', href: '/', count: '', image: 'https://images.unsplash.com/photo-1522199710521-72d69614c702?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Food', href: '/food', count: '150+', image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Cafe', href: '/cafe', count: '80+', image: 'https://images.unsplash.com/photo-1517705008128-361805f42e86?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Things To Do', href: '/things-to-do', count: '45+', image: 'https://images.unsplash.com/photo-1504714146340-959ca07b7bb1?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Events', href: '/events', count: '25+', image: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Recipe', href: '/recipe', count: '120+', image: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'About Us', href: '/about', count: '', image: 'https://images.unsplash.com/photo-1502920514313-52581002a659?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Contact Us', href: '/contact', count: '', image: 'https://images.unsplash.com/photo-1502920514313-52581002a659?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
  ];
  
  let activeCategory = '/';
  let isMobileSidebarOpen = false;
  let isDesktopSidebarOpen = true;
  let hasLoadedStorage = false;
  
  const setActiveCategory = (href) => {
    activeCategory = href;
  };
  
  // Get current path for initial active state
  $: if ($page.url.pathname) {
    activeCategory = $page.url.pathname;
  }

  // Persist desktop sidebar state across pages
  onMount(() => {
    if (browser) {
      const stored = localStorage.getItem('isDesktopSidebarOpen');
      if (stored !== null) {
        isDesktopSidebarOpen = stored === 'true';
      }
      const storedMobile = localStorage.getItem('isMobileSidebarOpen');
      if (storedMobile !== null) {
        isMobileSidebarOpen = storedMobile === 'true';
      }
      hasLoadedStorage = true;
    }
  });

  $: if (browser && hasLoadedStorage) {
    localStorage.setItem('isDesktopSidebarOpen', String(isDesktopSidebarOpen));
    localStorage.setItem('isMobileSidebarOpen', String(isMobileSidebarOpen));
  }
</script>

<nav class="bg-white border-b border-gray-200 sticky top-0 z-50">
  <div class="container mx-auto px-4">
    <div class="flex items-center justify-between">
      <!-- Logo -->
      <div class="flex items-center space-x-8">
        <h2 class="font-handwriting text-2xl font-bold text-gray-800">
          Kelantan <span class="text-primary-500">Foodie</span>
        </h2>
        
        <!-- Category Navigation -->
        <div class="hidden md:flex items-center space-x-6">
          {#each foodCategories as category, index}
            <a
              href={category.href}
              class="flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === category.href ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
              on:click={() => setActiveCategory(category.href)}
            >
              <span class="font-medium">{category.name}</span>
              {#if category.count}
                <span class="text-xs bg-gray-100 text-gray-600 px-2 py-1 rounded-full">{category.count}</span>
              {/if}
              
              <!-- Individual underline for each tab -->
              <div 
                class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === category.href ? 'w-full' : 'w-0'}"
              ></div>
            </a>
          {/each}
        </div>
      </div>
      
      <!-- Search and Social -->
      <div class="flex items-center space-x-4">
        <!-- Search icon only -->
        <button type="button" aria-label="Cari" title="Cari" class="p-2 border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-primary-500">
          <svg class="w-4 h-4 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
          </svg>
        </button>
        
        <!-- Social Media -->
        
      </div>
    </div>
    
    <!-- Mobile Category Menu -->
    <div class="md:hidden py-4">
      <div class="flex space-x-4 overflow-x-auto">
        {#each foodCategories as category, index}
          <a
            href={category.href}
            class="flex items-center space-x-2 py-2 px-3 whitespace-nowrap transition-colors relative {activeCategory === category.href ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory(category.href)}
          >
            <span class="font-medium text-sm">{category.name}</span>
            {#if category.count}
              <span class="text-xs bg-gray-100 text-gray-600 px-1.5 py-0.5 rounded-full">{category.count}</span>
            {/if}
            
            <!-- Individual underline for each mobile tab -->
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === category.href ? 'w-full' : 'w-0'}"
            ></div>
          </a>
        {/each}
      </div>
    </div>
  </div>
</nav>
 
<!-- Desktop: Sidebar kategori dengan gambar bulat dan container rounded -->
{#if isDesktopSidebarOpen}
  <aside class="hidden md:flex fixed left-3 top-1/2 -translate-y-1/2 z-50">
    <div class="bg-white/80 backdrop-blur-md text-gray-800 rounded-2xl border border-gray-200/60 shadow-xl px-3 py-4 flex flex-col items-center gap-2 relative">
      <!-- Tombol close di tengah atas container -->
      <button
        class="absolute top-1/2 -translate-y-1/2 -right-2 w-7 h-7 bg-white border border-gray-200 rounded-full shadow-md hover:shadow-lg transition-all duration-200 hover:scale-110 flex items-center justify-center text-gray-600 hover:text-gray-800"
        on:click={() => (isDesktopSidebarOpen = false)}
        aria-label="Tutup kategori"
        title="Tutup kategori"
      >
        <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="18" y1="6" x2="6" y2="18" />
          <line x1="6" y1="6" x2="18" y2="18" />
        </svg>
      </button>
      
      {#each foodCategories as category}
        <a
          href={category.href}
          aria-label={category.name}
          class="group flex flex-col items-center"
          on:click={() => setActiveCategory(category.href)}
        >
          <div class="w-14 h-14 rounded-full overflow-hidden border-2 border-white shadow-md ring-2 transition-all duration-200 {activeCategory === category.href ? 'ring-primary-500 scale-110' : 'ring-transparent group-hover:ring-white/60 group-hover:scale-105'}">
            <img src={category.image} alt={category.name} loading="lazy" decoding="async" width="56" height="56" class="w-full h-full object-cover" />
          </div>
          <span class="mt-1 text-[9px] font-medium text-center w-14 truncate text-gray-700">{category.name}</span>
        </a>
      {/each}
    </div>
  </aside>
{:else}
  <button
    class="hidden md:flex fixed left-2 top-1/2 -translate-y-1/2 z-50 bg-white text-gray-700 w-9 h-9 rounded-full border border-gray-200 shadow-md hover:shadow-lg active:scale-95 items-center justify-center transition-all duration-200"
    on:click={() => (isDesktopSidebarOpen = true)}
    aria-label="Buka kategori"
    title="Buka kategori"
  >
    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
      <circle cx="5" cy="5" r="1.5"/>
      <circle cx="12" cy="5" r="1.5"/>
      <circle cx="19" cy="5" r="1.5"/>
      <circle cx="5" cy="12" r="1.5"/>
      <circle cx="12" cy="12" r="1.5"/>
      <circle cx="19" cy="12" r="1.5"/>
      <circle cx="5" cy="19" r="1.5"/>
      <circle cx="12" cy="19" r="1.5"/>
      <circle cx="19" cy="19" r="1.5"/>
    </svg>
  </button>
{/if}

<!-- Mobile: tombol kecil untuk membuka sidebar kategori -->
<button
  class="md:hidden fixed left-2 top-1/2 -translate-y-1/2 z-50 bg-white text-gray-700 w-9 h-9 rounded-full border border-gray-200 shadow-md hover:shadow-lg active:scale-95 flex items-center justify-center transition-all duration-200"
  on:click={() => (isMobileSidebarOpen = !isMobileSidebarOpen)}
  aria-label={isMobileSidebarOpen ? 'Tutup kategori' : 'Buka kategori'}
  title={isMobileSidebarOpen ? 'Tutup kategori' : 'Buka kategori'}
>
  <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
    <circle cx="5" cy="5" r="1.5"/>
    <circle cx="12" cy="5" r="1.5"/>
    <circle cx="19" cy="5" r="1.5"/>
    <circle cx="5" cy="12" r="1.5"/>
    <circle cx="12" cy="12" r="1.5"/>
    <circle cx="19" cy="12" r="1.5"/>
    <circle cx="5" cy="19" r="1.5"/>
    <circle cx="12" cy="19" r="1.5"/>
    <circle cx="19" cy="19" r="1.5"/>
  </svg>
</button>

<!-- Mobile slide-out sidebar dari kiri -->
<div class="md:hidden">
  {#if isMobileSidebarOpen}
    <div
      class="fixed inset-0 bg-black/20 z-40"
      role="button"
      tabindex="0"
      aria-label="Tutup panel kategori"
      on:click={() => (isMobileSidebarOpen = false)}
      on:keydown={(e) => {
        if (e.key === 'Enter' || e.key === ' ' || e.key === 'Escape') {
          isMobileSidebarOpen = false;
        }
      }}
    ></div>
  {/if}
  <div
    class="fixed inset-y-0 left-0 z-50 w-16 transform transition-transform duration-300"
    class:translate-x-0={isMobileSidebarOpen}
    class:-translate-x-full={!isMobileSidebarOpen}
  >
    <div class="h-full bg-white/90 backdrop-blur-md rounded-r-2xl shadow-xl border border-gray-100 p-2 flex flex-col items-center justify-center gap-2 relative">
      <!-- Tombol close di tengah atas container mobile -->
      <button
        class="absolute top-1/2 -translate-y-1/2 -right-2 w-6 h-6 bg-white border border-gray-200 rounded-full shadow-md hover:shadow-lg transition-all duration-200 hover:scale-110 flex items-center justify-center text-gray-600 hover:text-gray-800"
        on:click={() => (isMobileSidebarOpen = false)}
        aria-label="Tutup kategori"
        title="Tutup kategori"
      >
        <svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="18" y1="6" x2="6" y2="18" />
          <line x1="6" y1="6" x2="18" y2="18" />
        </svg>
      </button>
      
      {#each foodCategories as category}
        <a
          href={category.href}
          aria-label={category.name}
          class="group flex flex-col items-center"
          on:click={() => {
            setActiveCategory(category.href);
            isMobileSidebarOpen = false;
          }}
        >
          <div class="w-12 h-12 rounded-full overflow-hidden border-2 border-white shadow-md ring-2 transition-all duration-200 {activeCategory === category.href ? 'ring-primary-500 scale-110' : 'ring-transparent group-hover:ring-gray-300 group-hover:scale-105'}">
            <img src={category.image} alt={category.name} loading="lazy" decoding="async" width="48" height="48" class="w-full h-full object-cover" />
          </div>
          <span class="mt-1 text-[8px] font-medium text-center w-16 truncate text-gray-700">{category.name}</span>
        </a>
      {/each}
    </div>
  </div>
</div>

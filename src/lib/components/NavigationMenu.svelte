<script>
  import { page } from '$app/stores';
  import { onMount } from 'svelte';
  import { browser } from '$app/environment';
  import { DEFAULT_WEBSITE, createWebsiteUrl } from '$lib/tenant';

  // Format tanggal
  const today = new Date();
  const formattedDate = today.toLocaleDateString('id-ID', {
    weekday: 'long', day: 'numeric', month: 'long', year: 'numeric'
  });

  export let website = DEFAULT_WEBSITE;

  const foodCategories = [
    { name: 'Food', href: '/food', count: '150+', image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Cafe', href: '/cafe', count: '80+', image: 'https://images.unsplash.com/photo-1517705008128-361805f42e86?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Things To Do', href: '/things-to-do', count: '45+', image: 'https://images.unsplash.com/photo-1504714146340-959ca07b7bb1?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Events', href: '/events', count: '25+', image: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
    { name: 'Recipe', href: '/recipe', count: '120+', image: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=128&h=128&fit=crop&crop=center&auto=format&dpr=2&q=80' },
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
    const pathParts = $page.url.pathname.split('/');
    // Remove website slug from path for active state
    activeCategory = '/' + pathParts.slice(2).join('/');
  }

  // Helper untuk membuat URL dengan slug website
  const getWebsiteUrl = (path) => {
    return createWebsiteUrl(website, path);
  };

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

<!-- Header -->
<header class="bg-white shadow-sm">
  <!-- Top Header -->
  <div class="bg-gray-50 py-4">
    <div class="container mx-auto px-4">
      <div class="flex items-center justify-between">
        <!-- Left: Date -->
        <div class="hidden md:block text-sm text-gray-600 font-medium">
          {formattedDate}
        </div>
        
        <!-- Logo -->
        <div class="text-center">
          <h1 class="font-handwriting text-3xl font-bold text-gray-800 hidden md:block">
            {website.name} <span class="font-sans text-lg font-normal">FOOD Review</span>
          </h1>
        </div>
        
        <!-- Social Media Links moved to right -->
        <div class="hidden md:flex flex-col items-center space-y-2">
          <span class="text-sm text-gray-600 font-medium">Follow me on</span>
          <div class="flex space-x-3">
            <a href="https://twitter.com/Kelantanfood" aria-label="Follow us on Twitter" class="w-8 h-8 bg-black rounded-full flex items-center justify-center text-white hover:bg-gray-800 transition-colors">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
              </svg>
            </a>
            <a href="https://instagram.com/Kelantanfood" aria-label="Follow us on Instagram" class="w-8 h-8 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full flex items-center justify-center text-white hover:from-purple-600 hover:to-pink-600 transition-colors">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>
              </svg>
            </a>
            <a href="https://youtube.com/Kelantanfood" aria-label="Follow us on YouTube" class="w-8 h-8 bg-red-600 rounded-full flex items-center justify-center text-white hover:bg-red-700 transition-colors">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
              </svg>
            </a>
            <a href="https://facebook.com/Kelantanfood" aria-label="Follow us on Facebook" class="w-8 h-8 bg-blue-600 rounded-full flex items-center justify-center text-white hover:bg-blue-700 transition-colors">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Navigation Menu -->
  <nav class="bg-white border-b border-gray-200 sticky top-0 z-50">
    <div class="container mx-auto px-4">
      <div class="flex items-center justify-between">
        <!-- Logo and Home -->
        <div class="flex items-center space-x-8">
          <h2 class="font-handwriting text-2xl font-bold text-gray-800">
            {website.name}
          </h2>
          
          <a
            href={getWebsiteUrl('/')}
            class="flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === '/' ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory('/')}
          >
            <span class="font-medium">Home</span>
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === '/' ? 'w-full' : 'w-0'}"
            ></div>
          </a>
        </div>
        
        <!-- Top Navigation -->
        <div class="flex items-center space-x-6">
          <a
            href={getWebsiteUrl('/about')}
            class="flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === '/about' ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory('/about')}
          >
            <span class="font-medium">About Us</span>
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === '/about' ? 'w-full' : 'w-0'}"
            ></div>
          </a>
          
          <a
            href={getWebsiteUrl('/advertise')}
            class="flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === '/advertise' ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory('/advertise')}
          >
            <span class="font-medium">Advertise</span>
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === '/advertise' ? 'w-full' : 'w-0'}"
            ></div>
          </a>
          
          <a
            href={getWebsiteUrl('/contact')}
            class="flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === '/contact' ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory('/contact')}
          >
            <span class="font-medium">Contact Us</span>
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === '/contact' ? 'w-full' : 'w-0'}"
            ></div>
          </a>
        </div>
      </div>
    </div>
  </nav>
</header>

<!-- Desktop: Sidebar kategori dengan gambar bulat dan container rounded -->
{#if isDesktopSidebarOpen}
  <aside class="hidden md:flex fixed left-3 top-1/2 -translate-y-1/2 z-50">
    <div class="bg-white/80 backdrop-blur-md text-gray-800 rounded-2xl border border-gray-200/60 shadow-xl px-3 py-4 flex flex-col items-center gap-2 relative">
      <!-- Logo di atas -->
      <div class="mb-4 text-center">
        <h2 class="font-handwriting text-lg font-bold text-gray-800">
          {website.name}
        </h2>
      </div>
      
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
          href={getWebsiteUrl(category.href)}
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
      <!-- Logo di atas mobile -->
      <div class="mb-4 text-center">
        <h2 class="font-handwriting text-sm font-bold text-gray-800">
          {website.name}
        </h2>
      </div>
      
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
          href={getWebsiteUrl(category.href)}
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
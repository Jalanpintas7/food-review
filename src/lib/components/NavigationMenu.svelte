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
  let isMobileNavOpen = false;
  
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
            {website.name}
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
                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
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
          <h2 class="font-handwriting text-2xl font-bold text-gray-800 md:hidden">
            {website.name}
          </h2>
          
          <a
            href={getWebsiteUrl('/')}
            class="hidden md:flex items-center space-x-2 py-4 px-2 transition-colors relative {activeCategory === '/' ? 'text-primary-500' : 'text-gray-600 hover:text-primary-500'}"
            on:click={() => setActiveCategory('/')}
          >
            <span class="font-medium">Home</span>
            <div 
              class="absolute bottom-0 left-1/2 transform -translate-x-1/2 h-0.5 bg-primary-500 transition-all duration-300 ease-in-out {activeCategory === '/' ? 'w-full' : 'w-0'}"
            ></div>
          </a>
        </div>
        
        <!-- Top Navigation -->
        <div class="hidden md:flex items-center space-x-6">
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

        <!-- Mobile Hamburger (kanan) -->
        <div class="md:hidden relative">
          <button
            class="inline-flex items-center justify-center w-10 h-10 rounded-md text-gray-700 hover:text-gray-900 focus:outline-none"
            aria-label={isMobileNavOpen ? 'Tutup menu' : 'Buka menu'}
            aria-expanded={isMobileNavOpen}
            on:click={() => (isMobileNavOpen = !isMobileNavOpen)}
          >
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <line x1="3" y1="6" x2="21" y2="6" />
              <line x1="3" y1="12" x2="21" y2="12" />
              <line x1="3" y1="18" x2="21" y2="18" />
            </svg>
          </button>

          {#if isMobileNavOpen}
            <div class="absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-md shadow-lg z-50">
              <a
                href={getWebsiteUrl('/')}
                class="block px-4 py-2 text-gray-700 hover:bg-gray-50"
                on:click={() => {
                  setActiveCategory('/');
                  isMobileNavOpen = false;
                }}
              >Home</a>
              <a
                href={getWebsiteUrl('/advertise')}
                class="block px-4 py-2 text-gray-700 hover:bg-gray-50"
                on:click={() => {
                  setActiveCategory('/advertise');
                  isMobileNavOpen = false;
                }}
              >Advertise</a>
              <a
                href={getWebsiteUrl('/about')}
                class="block px-4 py-2 text-gray-700 hover:bg-gray-50"
                on:click={() => {
                  setActiveCategory('/about');
                  isMobileNavOpen = false;
                }}
              >About Us</a>
              
              <a
                href={getWebsiteUrl('/contact')}
                class="block px-4 py-2 text-gray-700 hover:bg-gray-50"
                on:click={() => {
                  setActiveCategory('/contact');
                  isMobileNavOpen = false;
                }}
              >Contact Us</a>
            </div>
          {/if}
        </div>
      </div>
    </div>
  </nav>
  {#if isMobileNavOpen}
    <div
      class="fixed inset-0 z-40 bg-transparent"
      role="button"
      tabindex="0"
      aria-label="Tutup menu navigasi"
      on:click={() => (isMobileNavOpen = false)}
      on:keydown={(e) => {
        if (e.key === 'Enter' || e.key === ' ' || e.key === 'Escape') {
          isMobileNavOpen = false;
        }
      }}
    ></div>
  {/if}
</header>

<!-- Desktop: Sidebar kategori dengan gambar bulat dan container rounded -->
{#if isDesktopSidebarOpen}
  <aside class="hidden md:flex fixed left-3 top-1/2 -translate-y-1/2 z-50">
    <div class="bg-white/80 backdrop-blur-md text-gray-800 rounded-full border border-gray-200/60 shadow-xl px-3 py-4 flex flex-col items-center gap-2 relative">
      
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
  class="md:hidden fixed left-3 top-1/2 -translate-y-1/2 z-50 bg-white text-gray-700 w-9 h-9 rounded-full border border-gray-200 shadow-md hover:shadow-lg active:scale-95 flex items-center justify-center transition-all duration-200"
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
      class="fixed inset-0 bg-transparent z-40"
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
    class="fixed left-3 top-1/2 -translate-y-1/2 z-50 transform transition-all duration-300"
    class:translate-x-0={isMobileSidebarOpen}
    class:-translate-x-6={!isMobileSidebarOpen}
    class:opacity-100={isMobileSidebarOpen}
    class:opacity-0={!isMobileSidebarOpen}
    class:pointer-events-auto={isMobileSidebarOpen}
    class:pointer-events-none={!isMobileSidebarOpen}
  >
    <div class="bg-white/90 backdrop-blur-md rounded-full shadow-xl border border-gray-100 p-2 flex flex-col items-center justify-center gap-2 relative">
      
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

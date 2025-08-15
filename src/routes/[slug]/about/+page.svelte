<script>
  import { onMount } from 'svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';
  import { supabase } from '$lib/supabase.js';

  /** @type {import('./$types').PageData} */
  export let data;

  let aboutData = {};

  onMount(async () => {
    // Fetch About page content
    const { data: aboutContent, error } = await supabase
      .from('about')
      .select('*')
      .eq('website_id', data.website.id)
      .single();
    if (error) console.error('Error fetching about content:', error);
    else aboutData = aboutContent || {};
  });

  // Map icon names to SVG paths
  const iconSvgs = {
    'check-circle': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>',
    'eye': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>',
    'heart': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>',
    'shield-check': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>',
    'users': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>',
    'facebook': '<path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>',
    'youtube': '<path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>',
    'instagram': '<path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>',
    'globe': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"/>'
  };
</script>

<svelte:head>
  <title>{aboutData.tentang_kami?.title || 'About Us'} - {data.website.name}</title>
  <meta
    name="description"
    content={aboutData.tentang_kami?.description || 'Tentang Kami'}
  />
</svelte:head>

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  {#if aboutData.tentang_kami}
    <PageHeader 
      title={aboutData.tentang_kami.title}
      description={aboutData.tentang_kami.description}
    />
  {/if}

  <!-- Main Content -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50">
    <div class="container mx-auto px-4">
      <!-- Story Section -->
      {#if aboutData.cerita_kami && aboutData.image}
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 mb-20">
          <div class="space-y-8">
            <div class="bg-white p-8 rounded-2xl shadow-xl border border-gray-100 transform hover:scale-105 transition-all duration-300">
              <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
                {aboutData.cerita_kami.title}
              </h2>
              <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
              <div class="space-y-4">
                {#each (aboutData.cerita_kami.content || '').split('\n\n') as paragraph}
                  <p class="text-gray-600 leading-relaxed">{paragraph}</p>
                {/each}
              </div>
            </div>
          </div>
          <div class="relative group">
            <div class="absolute inset-0 bg-gradient-to-br from-red-600/20 to-orange-500/20 rounded-2xl transform rotate-3 group-hover:rotate-6 transition-transform duration-300"></div>
            <img
              src={aboutData.image.url}
              alt={aboutData.image.title}
              class="w-full h-96 object-cover rounded-2xl shadow-2xl transform -rotate-3 group-hover:-rotate-6 transition-transform duration-300"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent rounded-2xl"></div>
            <div class="absolute bottom-6 left-6 text-white">
              <h3 class="text-xl font-bold mb-2">{aboutData.image.title}</h3>
              <p class="text-sm opacity-90">{aboutData.image.subtitle}</p>
            </div>
          </div>
        </div>
      {/if}

      <!-- Mission & Vision -->
      {#if aboutData.misi || aboutData.visi}
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-20">
          {#if aboutData.misi}
            <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
              {#if aboutData.misi.icon_name}
                <div class="w-20 h-20 bg-gradient-to-br from-red-600 to-red-700 rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                  <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {@html iconSvgs[aboutData.misi.icon_name]}
                  </svg>
                </div>
              {/if}
              <h3 class="text-2xl font-bold text-gray-800 mb-3">{aboutData.misi.title}</h3>
              <div class="w-16 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
              <p class="text-gray-600 leading-relaxed">{aboutData.misi.content}</p>
            </div>
          {/if}
          {#if aboutData.visi}
            <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl shadow-xl border border-orange-100 transform hover:scale-105 transition-all duration-300">
              {#if aboutData.visi.icon_name}
                <div class="w-20 h-20 bg-gradient-to-br from-orange-600 to-red-600 rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                  <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {@html iconSvgs[aboutData.visi.icon_name]}
                  </svg>
                </div>
              {/if}
              <h3 class="text-2xl font-bold text-gray-800 mb-3">{aboutData.visi.title}</h3>
              <div class="w-16 h-1 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-6"></div>
              <p class="text-gray-600 leading-relaxed">{aboutData.visi.content}</p>
            </div>
          {/if}
        </div>
      {/if}

      <!-- Values -->
      {#if aboutData.nilai_nilai}
        <div class="bg-gradient-to-br from-white to-gray-50 p-10 rounded-3xl shadow-2xl border border-gray-100 mb-20">
          <div class="text-center mb-12">
            <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
              {aboutData.nilai_nilai.title}
            </h2>
            <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
            <p class="text-gray-600 max-w-2xl mx-auto">{aboutData.nilai_nilai.description}</p>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            {#each (aboutData.nilai_nilai.items || []).sort((a, b) => a.order_index - b.order_index) as value}
              <div class="text-center group">
                {#if value.icon_name}
                  <div class="w-20 h-20 bg-gradient-to-br from-{value.order_index % 2 === 0 ? 'red-600' : 'orange-600'} to-{value.order_index % 2 === 0 ? 'red-700' : 'red-600'} rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg transform group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      {@html iconSvgs[value.icon_name]}
                    </svg>
                  </div>
                {/if}
                <h3 class="text-xl font-bold text-gray-800 mb-3">{value.title}</h3>
                <p class="text-gray-600 leading-relaxed">{value.description}</p>
              </div>
            {/each}
          </div>
        </div>
      {/if}

      <!-- Team -->
      {#if aboutData.tim}
        <div class="text-center mb-20">
          <div class="mb-12">
            <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
              {aboutData.tim.title}
            </h2>
            <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
            <p class="text-gray-600 max-w-3xl mx-auto text-lg leading-relaxed">
              {aboutData.tim.description}
            </p>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            {#each (aboutData.tim.members || []).sort((a, b) => a.order_index - b.order_index) as member}
              <div class="text-center group">
                {#if member.image_url}
                  <div class="relative mb-6">
                    <div class="absolute inset-0 bg-gradient-to-br from-{member.order_index % 2 === 0 ? 'red-600' : 'orange-500'}/20 to-{member.order_index % 2 === 0 ? 'orange-500' : 'red-600'}/20 rounded-full transform {member.order_index % 2 === 0 ? 'rotate-3' : '-rotate-3'} group-hover:{member.order_index % 2 === 0 ? 'rotate-6' : '-rotate-6'} transition-transform duration-300"></div>
                    <img
                      src={member.image_url}
                      alt={member.name}
                      class="w-28 h-28 rounded-full mx-auto object-cover shadow-xl transform {member.order_index % 2 === 0 ? '-rotate-3' : 'rotate-3'} group-hover:{member.order_index % 2 === 0 ? '-rotate-6' : 'rotate-6'} transition-transform duration-300"
                    />
                  </div>
                {/if}
                <h3 class="text-xl font-bold text-gray-800 mb-2">{member.name}</h3>
                <p class="text-gray-600 font-medium">{member.position}</p>
              </div>
            {/each}
          </div>
        </div>
      {/if}

      <!-- Key Stats -->
      {#if aboutData.key_stats}
        <div class="mb-16">
          <div class="text-center mb-12">
            <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
              {aboutData.key_stats.title}
            </h2>
            <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
            <p class="text-gray-600 text-lg">{aboutData.key_stats.description}</p>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {#each (aboutData.key_stats.items || []).sort((a, b) => a.order_index - b.order_index) as stat}
              <div class="bg-gradient-to-br from-white to-{stat.order_index % 2 === 0 ? 'red-50' : 'orange-50'} p-8 rounded-2xl text-center transform hover:scale-105 transition-all duration-300 shadow-xl border border-{stat.order_index % 2 === 0 ? 'red-100' : 'orange-100'}">
                {#if stat.icon_name}
                  <div class="w-20 h-20 bg-gradient-to-br from-{stat.order_index % 2 === 0 ? 'red-600' : 'orange-600'} to-{stat.order_index % 2 === 0 ? 'red-700' : 'red-600'} rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill={['facebook', 'youtube', 'instagram'].includes(stat.icon_name) ? 'currentColor' : 'none'} stroke={['facebook', 'youtube', 'instagram'].includes(stat.icon_name) ? 'none' : 'currentColor'} viewBox="0 0 24 24">
                      {@html iconSvgs[stat.icon_name]}
                    </svg>
                  </div>
                {/if}
                <h3 class="text-lg font-bold text-gray-800 mb-3">{stat.title}</h3>
                <p class="text-4xl font-black bg-gradient-to-r from-{stat.order_index % 2 === 0 ? 'red-600' : 'orange-600'} to-{stat.order_index % 2 === 0 ? 'red-700' : 'red-600'} bg-clip-text text-transparent mb-2">{stat.value}</p>
                <p class="text-xs text-gray-500 font-medium">{stat.unit}</p>
              </div>
            {/each}
          </div>
          {#if aboutData.last_updated}
            <div class="text-center mt-12">
              <div class="inline-flex items-center bg-gradient-to-r from-red-100 to-orange-100 px-8 py-4 rounded-full border-2 border-red-300 shadow-xl">
                <div class="w-4 h-4 bg-gradient-to-r from-red-600 to-orange-600 rounded-full mr-4 animate-pulse shadow-sm"></div>
                <p class="text-red-800 text-lg font-bold">Last updated on {aboutData.last_updated}</p>
              </div>
            </div>
          {/if}
        </div>
      {/if}
    </div>
  </section>
</main>
<script>
  import { onMount } from 'svelte';
  import PageHeader from '$lib/components/PageHeader.svelte';
  import { supabase } from '$lib/supabase.js';

  /** @type {import('./$types').PageData} */
  export let data;

  let contactData = {};
  let formData = {
    name: '',
    email: '',
    subject: '',
    message: ''
  };

  onMount(async () => {
    // Fetch Contact page content
    const { data: contactContent, error } = await supabase
      .from('contact')
      .select('*')
      .eq('website_id', data.website.id)
      .single();
    if (error) console.error('Error fetching contact content:', error);
    else contactData = contactContent || {};
  });

  async function handleSubmit() {
    console.log('Form submitted:', formData);
    // Optionally, send form data to Supabase or another API
    /*
    const { error } = await supabase
      .from('form_submissions')
      .insert([{ website_id: data.website.id, ...formData, submitted_at: new Date() }]);
    if (error) console.error('Error submitting form:', error);
    */
    // Reset form
    formData = { name: '', email: '', subject: '', message: '' };
  }

  // Map icon names to SVG paths
  const iconSvgs = {
    'mail': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>',
    'location': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>',
    'phone': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>',
    'email': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>',
    'clock': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>',
    'twitter': '<path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>',
    'pinterest': '<path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>',
    'youtube': '<path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>',
    'instagram': '<path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>',
    'question': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>',
    'collaboration': '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>'
  };
</script>

<svelte:head>
  <title>{contactData.page_title || 'Contact Us'} - {data.website.name}</title>
  <meta
    name="description"
    content={contactData.page_description || 'Hubungi kami untuk pertanyaan, saran, atau kolaborasi.'}
  />
</svelte:head>

<main class="bg-gradient-to-br from-gray-50 via-white to-red-50">
  <!-- Page Header -->
  {#if contactData.page_title}
    <PageHeader 
      title={contactData.page_title}
      description={contactData.page_description}
      icon="mail"
    />
  {/if}

  <!-- Main Content -->
  <section class="py-16 bg-gradient-to-br from-red-50 to-orange-50">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 mb-20">
        <!-- Contact Form -->
        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
          <div class="flex items-center mb-6">
            <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
              <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                {@html iconSvgs['mail']}
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
                {#each (contactData.form?.subject_options || [{ value: '', label: 'Pilih subjek' }]) as option}
                  <option value={option.value}>{option.label}</option>
                {/each}
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
        {#if contactData.contact_info}
          <div class="space-y-8">
            <div class="bg-gradient-to-br from-white to-orange-50 p-8 rounded-2xl shadow-xl border border-orange-100 transform hover:scale-105 transition-all duration-300">
              <div class="flex items-center mb-6">
                <div class="w-12 h-12 bg-gradient-to-br from-orange-600 to-red-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                  <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {@html iconSvgs['location']}
                  </svg>
                </div>
                <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-orange-600 bg-clip-text text-transparent">
                  {contactData.contact_info.title}
                </h2>
              </div>
              <div class="w-20 h-1 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-8"></div>
              
              <div class="space-y-6">
                {#each contactData.contact_info.items as item}
                  <div class="flex items-start space-x-4 group">
                    <div class="w-12 h-12 bg-gradient-to-br from-{item.icon_name === 'email' || item.icon_name === 'location' ? 'red-100' : 'orange-100'} to-{item.icon_name === 'email' || item.icon_name === 'location' ? 'orange-100' : 'red-100'} rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                      <svg class="w-6 h-6 text-{item.icon_name === 'email' || item.icon_name === 'location' ? 'red-600' : 'orange-600'}" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        {@html iconSvgs[item.icon_name]}
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-bold text-gray-800 mb-1 group-hover:text-{item.icon_name === 'email' || item.icon_name === 'location' ? 'red-600' : 'orange-600'} transition-colors">{item.type}</h3>
                      {#each item.value as line}
                        <p class="text-gray-600 leading-relaxed">{line}</p>
                      {/each}
                    </div>
                  </div>
                {/each}
              </div>
            </div>

            <!-- Social Media -->
            {#if contactData.social_media}
              <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 transform hover:scale-105 transition-all duration-300">
                <div class="flex items-center mb-6">
                  <div class="w-12 h-12 bg-gradient-to-br from-red-600 to-red-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                      {@html iconSvgs['twitter']}
                    </svg>
                  </div>
                  <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent">
                    {contactData.social_media.title}
                  </h2>
                </div>
                <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 rounded-full mb-6"></div>
                <p class="text-gray-600 mb-6 leading-relaxed">
                  {contactData.social_media.description}
                </p>
                
                <div class="grid grid-cols-2 gap-4">
                  {#each contactData.social_media.platforms as platform}
                    <a href={platform.url} class="flex items-center space-x-3 p-4 bg-gradient-to-r from-{platform.gradient.from} to-{platform.gradient.to} rounded-xl hover:from-{platform.gradient.from.replace('50', '100')} hover:to-{platform.gradient.to.replace('50', '200')} transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
                      <svg class="w-6 h-6 text-{platform.icon_name === 'twitter' ? 'blue-600' : platform.icon_name === 'pinterest' ? 'pink-600' : platform.icon_name === 'youtube' ? 'red-600' : 'green-600'}" fill="currentColor" viewBox="0 0 24 24">
                        {@html iconSvgs[platform.icon_name]}
                      </svg>
                      <span class="font-bold text-gray-800">{platform.name}</span>
                    </a>
                  {/each}
                </div>
              </div>
            {/if}
          </div>
        {/if}
      </div>

      <!-- FAQ Section -->
      {#if contactData.faq}
        <div class="bg-gradient-to-br from-white to-gray-50 p-10 rounded-3xl shadow-2xl border border-gray-100 mb-20">
          <div class="text-center mb-12">
            <h2 class="text-4xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
              {contactData.faq.title}
            </h2>
            <div class="w-24 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
            <p class="text-gray-600 max-w-2xl mx-auto text-lg leading-relaxed">
              {contactData.faq.description}
            </p>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            {#each contactData.faq.items as item}
              <div class="bg-white p-6 rounded-2xl shadow-lg border border-gray-100 transform hover:scale-105 transition-all duration-300">
                <div class="w-12 h-12 bg-gradient-to-br from-{item.gradient.from} to-{item.gradient.to} rounded-xl flex items-center justify-center mb-4 shadow-lg">
                  <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {@html iconSvgs[item.icon_name]}
                  </svg>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">{item.question}</h3>
                <p class="text-gray-600 leading-relaxed">{item.answer}</p>
              </div>
            {/each}
          </div>
        </div>
      {/if}

      <!-- Map Section -->
      {#if contactData.map}
        <div class="bg-gradient-to-br from-white to-red-50 p-8 rounded-2xl shadow-xl border border-red-100 mb-20">
          <div class="text-center mb-8">
            <h2 class="text-3xl font-bold bg-gradient-to-r from-gray-800 to-red-600 bg-clip-text text-transparent mb-4">
              {contactData.map.title}
            </h2>
            <div class="w-20 h-1 bg-gradient-to-r from-red-600 to-orange-500 mx-auto rounded-full mb-6"></div>
            <p class="text-gray-600 max-w-2xl mx-auto">
              {contactData.map.description}
            </p>
          </div>
          
          <div class="relative h-96 rounded-2xl overflow-hidden shadow-2xl">
            <div class="absolute inset-0 bg-gradient-to-br from-red-600/10 to-orange-500/10 z-10"></div>
            <iframe 
              src={contactData.map.iframe_src}
              width="100%" 
              height="100%" 
              style="border:0;" 
              allowfullscreen="" 
              loading="lazy" 
              referrerpolicy="no-referrer-when-downgrade"
              class="relative z-0"
              title="Peta lokasi"
            ></iframe>
          </div>
        </div>
      {/if}
    </div>
  </section>
</main>
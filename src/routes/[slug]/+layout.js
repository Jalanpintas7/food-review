import { getWebsiteBySlug } from '$lib/tenant';
import { error } from '@sveltejs/kit';

/** @type {import('./$types').LayoutLoad} */
export async function load({ params }) {
  const website = await getWebsiteBySlug(params.slug);
  
  if (!website) {
    throw error(404, 'Website not found');
  }

  return {
    website
  };
}

import adapter from '@sveltejs/adapter-netlify';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			// Enable edge functions for better performance
			edge: false,
			// Split routes into separate functions
			split: false
		})
	}
};

export default config;
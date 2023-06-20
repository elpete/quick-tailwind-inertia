import { createApp, h } from "vue";
import Layout from "./Shared/Layout.vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from 'coldbox-vite-plugin/inertia-helpers';

createInertiaApp({
	id: "app",
	title: title => `${title} | Quick Tailwind Inertia Template`,
	resolve: async name => {
		let page = await resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue'))
		page.default.layout = page.default.layout || Layout;
		return page;
	},
	setup({ el, App, props, plugin }) {
		createApp({ render: () => h(App, props) })
			.use(plugin)
			.mount(el)
	},
});

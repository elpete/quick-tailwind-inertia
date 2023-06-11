import Layout from "./Shared/Layout.vue";
import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";

createInertiaApp({
	id: "app",
	title: title => `${title} | Quick Tailwind Inertia Template`,
	resolve: name => {
		const pages = import.meta.glob('./Pages/**/*.vue', { eager: true })
		let page = pages[`./Pages/${name}.vue`];
		page.default.layout = page.default.layout || Layout;
		return page;
	},
	setup({ el, App, props, plugin }) {
		createApp({ render: () => h(App, props) })
			.use(plugin)
			.mount(el)
	},
});

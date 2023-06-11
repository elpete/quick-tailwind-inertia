import { defineConfig } from "vite";
import coldbox from "coldbox-vite-plugin";
import vue from "@vitejs/plugin-vue";

export default ({ mode, command }) => {
	return defineConfig({
		plugins: [
			vue(),
			coldbox({
				input: ["resources/assets/css/app.css", "resources/assets/js/app.js"],
				refresh: true,
			})
		]
	});
};
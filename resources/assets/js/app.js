import Vue from "vue";
import VueMeta from "vue-meta";
import { InertiaApp } from "@inertiajs/inertia-vue";
import { InertiaProgress } from "@inertiajs/progress";

Vue.use(InertiaApp);
Vue.use(VueMeta);

InertiaProgress.init();

let app = document.getElementById("app");

new Vue({
    metaInfo: {
        title: "Loading…",
        titleTemplate: "%s | Quick Tailwind Inertia Template",
    },
    render: h => h(InertiaApp, {
        props: {
            initialPage: JSON.parse(app.dataset.page),
            resolveComponent: name => import(
                /* webpackChunkName: 'includes/js/pages/[request]' */ `@/Pages/${name}`
            ).then(module => module.default),
        },
    }),
}).$mount(app);

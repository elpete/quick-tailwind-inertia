const elixir = require("coldbox-elixir");

elixir.config.mergeConfig( {
    optimization: {
        splitChunks: {
            cacheGroups: {
                shared: {
                    chunks: "async",
                    minChunks: 2,
                    name: "includes/js/pages/shared"
                }
            }
        }
    }
} );

module.exports = elixir(mix => {
    mix.css("app.css");
    mix.vue("app.js");
});

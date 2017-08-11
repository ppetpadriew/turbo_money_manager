var config = {
    entry: ["./src/static/js/pages/dashboard-page.js"],
    output: {
        path: __dirname + "/public",
        filename: "bundles.js"
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /(node_modules|vendor)/,
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: ["env"]
                    }
                }
            }
        ]
    },
    // devtool: "source-map"
};
module.exports = config;

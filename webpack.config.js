var config = {
    entry: ["./web/js/pages/dashboard-page.js"],
    output: {
        path: __dirname + "/web/js/",
        filename: "bundle.js"
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
    devtool: "source-map"
};
module.exports = config;

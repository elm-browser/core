module.exports = config => {
    config.set({
        basePath : "."
        , browsers : [ "Chrome" ]
        , files : [
            "test/**/index.js"
        ]
        , preprocessors : {
            "test/**/index.js" : "webpack"
        }
        , webpack : require("./webpack.config.js")
    })
}

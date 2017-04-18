module.exports = {
    entry : {
        "file" : "./test/File/index.js"
    }
    , output : {
        filename : "[name].js"
        , path : "dist"
    }
    , module : {
        loaders : [
            { test : /\.elm$/
            , exclude : [ /elm-stuff/, /node_modules/ ]
            , loader : "elm-webpack-loader"
            }
        ]
        , noParse : [ /\.elm$/ ]
    }
    , target : "web"
}

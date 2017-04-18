const App = require("./Main.elm")
document.addEventListener("DOMContentLoaded", () => {
    App.Main.worker({
        blob : new Blob([ "blob" ])
        , file : new File([ "file" ], "test")
    })
})

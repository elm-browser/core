const App = require("./Main.elm")
document.addEventListener("DOMContentLoaded", () => {
    const dialog = document.createElement("dialog")
    document.body.append(dialog)
    App.Main.worker()
})

const _elm_browser$core$Native_Dialog = function () {
    const { nativeBinding, succeed, fail } = _elm_lang$core$Native_Scheduler
    const { Tuple0 } = _elm_lang$core$Native_Utils


    // close: () -> Task Decode.Value ()
    const close = () => nativeBinding(callback => {
        try {
            const dialog = document.querySelector("dialog")
            if (!dialog) return callback(fail(new Error("No dialog element not found.")))
            dialog.close()
            return callback(succeed(Tuple0))
        } catch (error) { return callback(fail(error)) }
    })


    // showModal: () -> Task Decode.Value ()
    const show = () => nativeBinding(callback => {
        try {
            const dialog = document.querySelector("dialog")
            if (!dialog) return callback(fail(new Error("No dialog element not found.")))
            dialog.show()
            return callback(succeed(Tuple0))
        } catch (error) { return callback(fail(error)) }
    })


    // showModal: () -> Task Decode.Value ()
    const showModal = () => nativeBinding(callback => {
        try {
            const dialog = document.querySelector("dialog")
            if (!dialog) return callback(fail(new Error("No dialog element not found.")))
            dialog.showModal()
            return callback(succeed(Tuple0))
        } catch (error) { return callback(fail(error)) }
    })


    const exports =
        { close
        , show
        , showModal
        }
    return exports
}()

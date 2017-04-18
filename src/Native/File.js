const _elm_browser$core$Native_File = function () {
    const { fail, nativeBinding, succeed } = _elm_lang$core$Native_Scheduler


    const readAsDataUrl = blob => nativeBinding(callback => {
        try {
            const reader = new FileReader()
            reader.onerror = event => {
                const error = reader.error
                callback(fail(error))
            }
            reader.onload = event => {
                const result = reader.result
                callback(succeed(result))
            }
            reader.readAsDataURL(blob)
        } catch (error) { return callback(fail(error)) }
    })


    const exports =
        { readAsDataUrl
        }
    return exports
}()

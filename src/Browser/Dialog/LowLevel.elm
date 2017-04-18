module Browser.Dialog.LowLevel
    exposing
        ( close
        , show
        , showModal
        )

import Json.Decode as Decode
import Task exposing (Task)
import Native.Dialog


close : () -> Task Decode.Value ()
close =
    Native.Dialog.close


show : () -> Task Decode.Value ()
show =
    Native.Dialog.show


showModal : () -> Task Decode.Value ()
showModal =
    Native.Dialog.showModal

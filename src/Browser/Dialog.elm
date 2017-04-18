module Browser.Dialog
    exposing
        ( close
        , show
        , showModal
        )

{-| Native bindings to HTMLDialogElement api.

@docs close , show , showModal

-}

import Browser.Dialog.LowLevel as LowLevel
import Browser.Error as Error exposing (Error)
import Task exposing (Task)


{-| -}
close : () -> Task Error ()
close tuple0 =
    LowLevel.close tuple0
        |> Task.mapError Error.fromValue


{-| -}
show : () -> Task Error ()
show tuple0 =
    LowLevel.show tuple0
        |> Task.mapError Error.fromValue


{-| -}
showModal : () -> Task Error ()
showModal tuple0 =
    LowLevel.showModal tuple0
        |> Task.mapError Error.fromValue

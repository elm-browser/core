module Browser.File
    exposing
        ( Blob
        , readBlobAsDataUrl
        , File
        , readFileAsDataUrl
        )

{-| Native bindings for Browser FileReader

@docs Blob , readBlobAsDataUrl , File , readFileAsDataUrl

-}

import Browser.File.LowLevel as LowLevel exposing (File, Blob)
import Browser.Error as Error exposing (Error)
import Task exposing (Task)


{-| -}
type alias Blob =
    LowLevel.Blob


{-| -}
type alias File =
    LowLevel.File


{-| -}
readFileAsDataUrl : File -> Task Error String
readFileAsDataUrl file =
    LowLevel.readFileAsDataUrl file
        |> Task.mapError Error.fromValue


{-| -}
readBlobAsDataUrl : Blob -> Task Error String
readBlobAsDataUrl blob =
    LowLevel.readBlobAsDataUrl blob
        |> Task.mapError Error.fromValue

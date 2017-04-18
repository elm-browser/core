module Browser.File.LowLevel
    exposing
        ( File
        , readFileAsDataUrl
        , Blob
        , readBlobAsDataUrl
        )

import Json.Decode as Decode
import Task exposing (Task)
import Native.File


type alias File =
    Decode.Value


type alias Blob =
    Decode.Value


readFileAsDataUrl : File -> Task Decode.Value String
readFileAsDataUrl =
    Native.File.readAsDataUrl


readBlobAsDataUrl : Blob -> Task Decode.Value String
readBlobAsDataUrl =
    Native.File.readAsDataUrl

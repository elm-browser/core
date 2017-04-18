module Browser.Error
    exposing
        ( Error(..)
        , fromValue
        )

{-| Native binding for Browser error.

@docs Error , fromValue

-}

import Json.Decode as Decode
import Result.Extra as Result


{-| -}
type Error
    = Error String String


errorDecoder : Decode.Decoder Error
errorDecoder =
    Decode.map2 Error
        (Decode.field "name" Decode.string)
        (Decode.field "message" Decode.string)


{-| -}
fromValue : Decode.Value -> Error
fromValue value =
    Decode.decodeValue errorDecoder value
        |> Result.extract (\error -> Error "Unable to decode error value:" error)

module Main exposing (main)

import Browser.Error as Error exposing (Error(Error))
import Browser.File as FileReader exposing (Blob, File)
import Task


type alias Flags =
    { blob : Blob
    , file : File
    }


type Msg
    = TestComplete (Result Error ())



-- File Api:
-- new Blob([byte:domstring|blob|arraybuffer|arraybufferview], {type:string})
-- new File([byte:domstring|blob|arraybuffer|arraybufferview], name:string, {type:string, lastModified:date})
-- blob = Blob or File
-- FileReader


init : Flags -> ( {}, Cmd Msg )
init { blob, file } =
    let
        isDataUrl =
            String.contains "data:"
    in
        {}
            ! [ Task.succeed ()
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "readBlobAsDataUrl"
                            in
                                FileReader.readBlobAsDataUrl blob
                                    |> Task.andThen
                                        (\value ->
                                            if isDataUrl value then
                                                Task.succeed ()
                                            else
                                                Task.fail <| Error.Error "TestError" "readBlobAsDataUrl failed"
                                        )
                        )
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "readFileAsDataUrl"
                            in
                                FileReader.readFileAsDataUrl file
                                    |> Task.andThen
                                        (\value ->
                                            if isDataUrl value then
                                                Task.succeed ()
                                            else
                                                Task.fail <| Error "TestError" "readFileAsDataUrl failed"
                                        )
                        )
                    |> Task.attempt TestComplete
              ]


main : Program Flags {} Msg
main =
    Platform.programWithFlags
        { init = init
        , update =
            (\msg model ->
                let
                    m =
                        Debug.log "Elm" msg
                in
                    ( model, Cmd.none )
            )
        , subscriptions = always Sub.none
        }

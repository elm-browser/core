module Main exposing (main)

import Browser.Error as Error exposing (Error(Error))
import Browser.Window as Window


type Msg
    = TestComplete (Result Error String)


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Window" "Init"
    in
        {}
            ! []


main : Program Never {} Msg
main =
    Platform.program
        { init = init
        , update =
            (\msg model ->
                let
                    m =
                        Debug.log "Window" msg
                in
                    ( model, Cmd.none )
            )
        , subscriptions =
            (\_ -> Window.unloading <| TestComplete <| Ok "Unloading")
        }

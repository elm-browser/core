module Main exposing (main)

import Browser.Dialog as Dialog
import Browser.Error as Error exposing (Error)
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Dialog" "Init"
    in
        {}
            ! [ Task.succeed ()
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "show"
                            in
                                Dialog.show ()
                        )
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "close"
                            in
                                Dialog.close ()
                        )
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "showModal"
                            in
                                Dialog.showModal ()
                        )
                    |> Task.attempt TestComplete
              ]


main : Program Never {} Msg
main =
    Platform.program
        { init = init
        , update =
            (\msg model ->
                let
                    m =
                        Debug.log "Dialog" msg
                in
                    ( model, Cmd.none )
            )
        , subscriptions = always Sub.none
        }

effect module Browser.Window
    where { subscription = MySub }
    exposing
        ( unloading
        )

{-| Bindings for Window api.

@docs unloading

-}

import Dom.LowLevel as Dom
import Json.Decode as Decode
import Process
import Task exposing (Task)


{-| -}
unloading : msg -> Sub msg
unloading msg =
    subscription (Unloading msg)



-- Effect Manager


type MySub msg
    = Unloading msg


subMap : (a -> b) -> MySub a -> MySub b
subMap fn (Unloading a) =
    Unloading (a |> fn)


type alias State msg =
    Maybe
        { pid : Process.Id
        , subscriptions : List (MySub msg)
        }


init : Task Never (State msg)
init =
    Task.succeed Nothing


onEffects : Platform.Router msg () -> List (MySub msg) -> State msg -> Task Never (State msg)
onEffects router subscriptions state =
    case ( state, subscriptions ) of
        ( Nothing, [] ) ->
            -- do we ever get here?
            Task.succeed Nothing

        ( Nothing, _ ) ->
            Process.spawn
                (Dom.onWindow "beforeunload"
                    (Decode.succeed ())
                    (\_ -> Platform.sendToSelf router ())
                )
                |> Task.andThen
                    (\pid -> Task.succeed <| Just { pid = pid, subscriptions = subscriptions })

        ( Just { pid }, [] ) ->
            Process.kill pid
                |> Task.map (always Nothing)

        ( Just { pid }, _ ) ->
            Task.succeed <| Just { pid = pid, subscriptions = subscriptions }


onSelfMsg : Platform.Router msg () -> () -> State msg -> Task Never (State msg)
onSelfMsg router _ state =
    case state of
        Nothing ->
            -- do we ever get here?
            Task.succeed state

        Just { subscriptions } ->
            let
                tasks =
                    List.map
                        (\subscription ->
                            case subscription of
                                Unloading msg ->
                                    Platform.sendToApp router msg
                        )
                        subscriptions
            in
                Task.sequence tasks
                    |> Task.map (always state)

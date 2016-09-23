module State exposing (..)

import Types exposing (..)
import State.Config as Cfg
import State.Pomo as Pomo


updateApp : Msg -> AppState -> ( AppState, Cmd Msg )
updateApp msg appState =
    case appState of
        Config cfg ->
            Cfg.update msg cfg

        Running state ->
            Pomo.update msg state

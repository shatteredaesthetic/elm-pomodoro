module State.Config exposing (update)

import Types exposing (..)
import State.Counter as Count
import State.Util exposing (..)
import State.Init exposing (initState)


update : Msg -> ConfigState -> ( AppState, Cmd Msg )
update msg cfg =
    case msg of
        Session op ->
            let
                newCounter =
                    Count.update op cfg.session
            in
                Config { cfg | session = newCounter } ! []

        Short op ->
            let
                newCounter =
                    Count.update op cfg.short
            in
                Config { cfg | short = newCounter } ! []

        Long op ->
            let
                newCounter =
                    Count.update op cfg.long
            in
                Config { cfg | long = newCounter } ! []

        Cycles op ->
            let
                newCounter =
                    Count.update op cfg.cycles
            in
                Config { cfg | cycles = newCounter } ! []

        StartCount ->
            let
                f =
                    .num >> ((*) 60)

                defaults =
                    Defaults (f cfg.session) (f cfg.short) (f cfg.long) cfg.cycles.num
            in
                (Running <| initState defaults) ! [ delay ms10 TogglePlay ]

        _ ->
            Config cfg ! []

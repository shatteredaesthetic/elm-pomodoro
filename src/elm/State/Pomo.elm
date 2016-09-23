module State.Pomo exposing (update)

import Types exposing (..)
import State.Util exposing (..)
import State.Init exposing (initConfig)


update : Msg -> RunState -> ( AppState, Cmd Msg )
update msg state =
    case msg of
        TogglePlay ->
            let
                newState =
                    { state | counting = not state.counting }
            in
                Running newState ! []

        Reset ->
            initConfig
                |> Config
                |> wrapEmptyCmd

        Switch ->
            case state.status of
                OffFocus ->
                    let
                        newState =
                            { state
                                | countdown = state.defaults.session
                                , label = "Session"
                                , status = OnFocus
                                , counting = not state.counting
                            }
                    in
                        Running newState ! [ delay ms10 TogglePlay ]

                OnFocus ->
                    switchBreak state

        Tick t ->
            case state.counting of
                False ->
                    Running state ! []

                True ->
                    if state.countdown == 0 then
                        Running state ! [ delay ms10 Switch ]
                    else
                        Running { state | countdown = state.countdown - 1 } ! []

        _ ->
            Running state ! []


switchBreak : RunState -> ( AppState, Cmd Msg )
switchBreak state =
    let
        newState =
            case state.cycles of
                1 ->
                    { state
                        | countdown = state.defaults.long
                        , label = "Long Break"
                        , status = OffFocus
                        , cycles = state.defaults.cycles
                        , counting = not state.counting
                    }

                _ ->
                    { state
                        | countdown = state.defaults.short
                        , label = "Short Break"
                        , status = OffFocus
                        , cycles = state.cycles - 1
                        , counting = not state.counting
                    }
    in
        Running newState ! [ delay ms10 TogglePlay ]

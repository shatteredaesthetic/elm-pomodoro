module View.Pomo exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


view : RunState -> Html Msg
view runState =
    div
        []
        [ div [] [ text <| toString runState.countdown ]
        , div [] [ text runState.label ]
        , div [] [ text <| toString runState.cycles ]
        , div
            []
            [ div
                [ onClick TogglePlay ]
                [ text <|
                    if runState.counting then
                        "Pause"
                    else
                        "Play"
                ]
            , div
                [ onClick Reset ]
                [ text "Reset" ]
            ]
        , hr [] []
        , div [] [ text <| toString runState ]
        ]

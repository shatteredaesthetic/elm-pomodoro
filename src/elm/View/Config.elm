module View.Config exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Html.App as App
import Types exposing (..)
import View.Counter as Counter


view : ConfigState -> Html Msg
view configState =
    div
        []
        [ div
            []
            [ App.map Session <| Counter.view configState.session
            , App.map Short <| Counter.view configState.short
            , App.map Long <| Counter.view configState.long
            , App.map Cycles <| Counter.view configState.cycles
            ]
        , div
            [ class "button"
            , onClick StartCount
            ]
            [ text "Start" ]
        ]

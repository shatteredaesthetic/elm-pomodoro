module View.Config exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App as App
import Color
import FontAwesome as Icon
import Types exposing (..)
import View.Counter exposing (..)
import View.Util exposing (..)


view : ConfigState -> Html Msg
view configState =
    div
        [ styleList [ flexStyle, stretchStyle, centerStyle, parcelStyle ] ]
        [ div [ styleList [ flexStyle, centerStyle, rightSide ] ]
            [ App.map Session <| viewUpLeft configState.session
            , App.map Cycles <| viewDownLeft configState.cycles
            ]
        , div [ styleList [ flexStyle, centerStyle, centerSide ] ]
            [ div
                [ onClick StartCount ]
                [ Icon.play_circle_o (Color.rgb 14 11 22) 75 ]
            ]
        , div [ styleList [ flexStyle, centerStyle, leftSide ] ]
            [ App.map Short <| viewUpRight configState.short
            , App.map Long <| viewDownRight configState.long
            ]
        ]


rightSide : List Attr
rightSide =
    [ "flex-direction" => "column"
    , "justify-content" => "space-around"
    , "flex" => "4"
    ]


leftSide : List Attr
leftSide =
    [ "flex-direction" => "column"
    , "justify-content" => "space-around"
    , "flex" => "4"
    ]


centerSide : List Attr
centerSide =
    [ "flex" => "3" ]

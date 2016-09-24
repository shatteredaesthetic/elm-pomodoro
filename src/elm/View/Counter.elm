module View.Counter exposing (viewUpLeft, viewUpRight, viewDownLeft, viewDownRight)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Color
import FontAwesome as Icon
import Types exposing (..)
import View.Util exposing (..)


viewUpRight : BoundedCounter -> Html ChangeCounter
viewUpRight model =
    div [ style containerStyle ]
        [ div
            [ style <| List.concat [ flexStyle, centerStyle, labelStyle ] ]
            [ text model.label ]
        , numBox model
        ]


viewDownRight : BoundedCounter -> Html ChangeCounter
viewDownRight model =
    div [ style containerStyle ]
        [ numBox model
        , div
            [ style <| List.concat [ flexStyle, centerStyle, labelStyle ] ]
            [ text model.label ]
        ]


viewDownLeft : BoundedCounter -> Html ChangeCounter
viewDownLeft model =
    div [ style containerStyle ]
        [ numBoxReversed model
        , div
            [ style <| List.concat [ flexStyle, centerStyle, labelStyle ] ]
            [ text model.label ]
        ]


viewUpLeft : BoundedCounter -> Html ChangeCounter
viewUpLeft model =
    div [ style containerStyle ]
        [ div
            [ style <| List.concat [ flexStyle, centerStyle, labelStyle ] ]
            [ text model.label ]
        , numBoxReversed model
        ]


numBox : BoundedCounter -> Html ChangeCounter
numBox model =
    div
        [ style <| List.concat [ flexStyle, boxStyle ] ]
        [ div
            [ style <| List.concat [ flexStyle, centerStyle, valBoxStyle ] ]
            [ div [ style <| List.concat [ flexStyle, centerStyle ] ]
                [ text <| toString model.num ]
            ]
        , div
            [ style <| List.concat [ flexStyle, btnRowStyle ] ]
            [ div
                [ onClick Increment
                , style <| List.concat [ flexStyle, btnStyle ]
                ]
                [ Icon.chevron_up (Color.rgb 14 11 22) 25 ]
            , div
                [ onClick Decrement
                , style <| List.concat [ flexStyle, btnStyle ]
                ]
                [ Icon.chevron_down (Color.rgb 14 11 22) 25 ]
            ]
        ]


numBoxReversed : BoundedCounter -> Html ChangeCounter
numBoxReversed model =
    div
        [ style <| List.concat [ flexStyle, boxStyle ] ]
        [ div
            [ style <| List.concat [ flexStyle, btnRowStyle ] ]
            [ div
                [ onClick Increment
                , style <| List.concat [ flexStyle, btnStyle ]
                ]
                [ Icon.chevron_up (Color.rgb 14 11 22) 25 ]
            , div
                [ onClick Decrement
                , style <| List.concat [ flexStyle, btnStyle ]
                ]
                [ Icon.chevron_down (Color.rgb 14 11 22) 25 ]
            ]
        , div
            [ style <| List.concat [ flexStyle, centerStyle, valBoxStyle ] ]
            [ div [ style <| List.concat [ flexStyle, centerStyle ] ]
                [ text <| toString model.num ]
            ]
        ]



-- STYLES


containerStyle : List Attr
containerStyle =
    [ "width" => "15vw"
    , "flex-direction" => "column"
    , "color" => "#0e0b16"
    ]


btnRowStyle : List Attr
btnRowStyle =
    [ "flex-direction" => "column"
    , "flex" => "1 1 33%"
    ]


valBoxStyle : List Attr
valBoxStyle =
    [ "flex" => "2 1 67%"
    , "font-family" => "Arial Black"
    , "font-size" => "5em"
    ]


labelStyle : List Attr
labelStyle =
    [ "font-size" => "2em"
    , "flex" => "1 1 25%"
    ]


boxStyle : List Attr
boxStyle =
    [ "flex" => "1 1 75%"
    ]

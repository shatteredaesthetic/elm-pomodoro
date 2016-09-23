module View.Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)
import View.Util exposing (..)


view : BoundedCounter -> Html ChangeCounter
view model =
    div [ style containerStyle ]
        [ div
            [ styleList [ flexStyle, centerStyle, labelStyle ] ]
            [ text "Label" ]
        , div
            [ styleList [ flexStyle, boxStyle ] ]
            [ div
                [ styleList [ flexStyle, centerStyle, valBoxStyle ] ]
                [ div [] [ text <| toString model.num ] ]
            , div
                [ styleList [ flexStyle, btnRowStyle ] ]
                [ button
                    [ onClick Increment
                    , styleList [ flexStyle, btnStyle ]
                    ]
                    [ text "+" ]
                , button
                    [ onClick Decrement
                    , styleList [ flexStyle, btnStyle ]
                    ]
                    [ text "-" ]
                ]
            ]
        ]



-- STYLES


containerStyle : List Attr
containerStyle =
    [ "width" => "25vw"
    , "flex-direction" => "column"
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


btnStyle : List Attr
btnStyle =
    [ "flex" => "1"
    , "font-size" => "3em"
    , "cursor" => "pointer"
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

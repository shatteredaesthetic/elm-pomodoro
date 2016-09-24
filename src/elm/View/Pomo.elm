module View.Pomo exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import String exposing (padLeft)
import Color
import FontAwesome as Icon
import Types exposing (..)
import View.Util exposing (..)


view : RunState -> Html Msg
view runState =
    div
        [ styleList [ flexStyle, stretchStyle, columnStyle, parcelStyle ] ]
        [ clockRow runState
        , btnRow runState
        , footerRow runState
        ]


footerRow : RunState -> Html Msg
footerRow state =
    div
        [ styleList [ flexStyle, splitStyle, relativeStyle ] ]
        [ div [ styleList [ textStyle, labelStyle ] ] [ text state.label ]
        , div [ styleList [ flexStyle, centerStyle, footerStyle ] ]
            [ span [ style spanStyle ] [ text "Cycles left:" ]
            , div [ style textStyle ] [ text <| toString <| state.cycles - 1 ]
            ]
        ]


clockRow : RunState -> Html Msg
clockRow state =
    div
        [ styleList [ flexStyle, splitStyle, relativeStyle ] ]
        [ div [ style titleStyle ] [ text "Pomodoro" ]
        , div [ styleList [ textStyle, timerStyle ] ] [ text <| displayTime state.countdown ]
        ]


btnRow : RunState -> Html Msg
btnRow state =
    div
        [ styleList [ flexStyle, expandStyle, centerStyle ] ]
        [ div
            [ onClick TogglePlay ]
            [ if state.counting then
                Icon.pause_circle_o (Color.rgb 14 11 22) 75
              else
                Icon.play_circle_o (Color.rgb 14 11 22) 75
            ]
        , div
            [ onClick Reset ]
            [ Icon.refresh (Color.rgb 14 11 22) 65 ]
        ]


displayTime : Int -> String
displayTime cnt =
    let
        m =
            cnt // 60

        s =
            cnt % 60

        f x =
            x |> toString |> padLeft 2 '0'
    in
        f m ++ ":" ++ f s



--STYLE


textStyle : List Attr
textStyle =
    [ "font-family" => "Arial Black"
    , "font-size" => "4em"
    , "color" => "#0e0b16"
    , "text-shadow" => "1px 1px 1px #e7dfdd"
    ]


splitStyle : List Attr
splitStyle =
    [ "justify-content" => "space-between" ]


expandStyle : List Attr
expandStyle =
    [ "flex" => "1" ]


titleStyle : List Attr
titleStyle =
    [ "font-family" => "Arial Black"
    , "font-size" => "4em"
    , "color" => "#4717f6"
    , "position" => "absolute"
    , "top" => "-55px"
    ]


labelStyle : List Attr
labelStyle =
    [ "text-shadow" => "1px -1px 1px #e7dfdd"
    , "position" => "absolute"
    , "bottom" => "-18px"
    ]


timerStyle : List Attr
timerStyle =
    [ "position" => "absolute"
    , "top" => "-22px"
    , "right" => "0px"
    ]


spanStyle : List Attr
spanStyle =
    [ "font-size" => "1.2em"
    , "margin-right" => "8px"
    ]


footerStyle : List Attr
footerStyle =
    [ "position" => "absolute"
    , "right" => "4px"
    , "bottom" => "-10px"
    ]

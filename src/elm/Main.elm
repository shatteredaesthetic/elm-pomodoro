module Main exposing (..)

import Html exposing (Html, div)
import Html.App as App
import Time exposing (Time, every, second)
import Types exposing (..)
import View.Config as Cfg
import View.Pomo as Pomo
import View.Util exposing (..)
import State exposing (updateApp)
import State.Init exposing (initConfig)


-- APP


main : Program Never
main =
    App.program
        { init = Config initConfig ! []
        , view = view
        , update = updateApp
        , subscriptions = subscriptions
        }


view : AppState -> Html Msg
view appState =
    let
        body =
            case appState of
                Config cfg ->
                    Cfg.view cfg

                Running state ->
                    Pomo.view state
    in
        div [ styleList [ fullScreen, flexStyle, centerStyle ] ] [ body ]



-- CSS STYLES
-- SUBSCRIPTIONS


subscriptions : AppState -> Sub Msg
subscriptions model =
    Time.every second Tick


fullScreen : List Attr
fullScreen =
    [ "width" => "100vw"
    , "height" => "100vh"
    , "border" => "1px solid red"
    , "background" => "#0e0b16"
    ]

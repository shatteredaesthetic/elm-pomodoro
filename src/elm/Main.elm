module Main exposing (..)

--import Html.App as App
--import Html.Events exposing (onClick)

import Html exposing (Html)
import Html.App as App
import Time exposing (Time, every, second)
import Types exposing (..)
import View.Config as Cfg
import View.Pomo as Pomo
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
    case appState of
        Config cfg ->
            Cfg.view cfg

        Running state ->
            Pomo.view state



-- CSS STYLES
-- SUBSCRIPTIONS


subscriptions : AppState -> Sub Msg
subscriptions model =
    Time.every second Tick

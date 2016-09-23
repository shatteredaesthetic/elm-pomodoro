module State.Util exposing (..)

import Types exposing (..)
import Time exposing (Time, millisecond)
import Task
import Process


delay : Time -> Msg -> Cmd Msg
delay t msg =
    Task.perform (always msg) (always msg) (Process.sleep t)


wrapEmptyCmd : AppState -> ( AppState, Cmd Msg )
wrapEmptyCmd appState =
    appState ! []


sec' : Time
sec' =
    1000 * millisecond


ms10 : Time
ms10 =
    10 * millisecond

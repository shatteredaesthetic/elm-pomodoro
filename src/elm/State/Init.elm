module State.Init exposing (initConfig, initState)

import Types exposing (..)
import State.Counter as Count


initState : Defaults -> RunState
initState defaults =
    { countdown = defaults.session
    , label = "Session"
    , status = OnFocus
    , cycles = defaults.cycles
    , defaults = defaults
    , counting = False
    }


initConfig : ConfigState
initConfig =
    { session = Count.init "Session" 15 10 20
    , short = Count.init "Short Break" 4 2 7
    , long = Count.init "Long Break" 7 5 10
    , cycles = Count.init "Cycles" 3 2 4
    }

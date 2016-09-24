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
    { session = Count.init "Session" 25 20 30
    , short = Count.init "Short Break" 5 3 8
    , long = Count.init "Long Break" 15 12 18
    , cycles = Count.init "Cycles" 3 2 4
    }

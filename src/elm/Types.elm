module Types exposing (..)

import Time exposing (Time)


type alias RunState =
    { countdown : Int
    , label : String
    , status : Status
    , cycles : Int
    , defaults : Defaults
    , counting : Bool
    }


type alias Defaults =
    { session : Int
    , short : Int
    , long : Int
    , cycles : Int
    }


type alias ConfigState =
    { session : BoundedCounter
    , short : BoundedCounter
    , long : BoundedCounter
    , cycles : BoundedCounter
    }


type Status
    = OnFocus
    | OffFocus


type AppState
    = Config ConfigState
    | Running RunState


type Msg
    = NoOp
    | TogglePlay
    | Reset
    | Tick Time
    | Switch
    | Session ChangeCounter
    | Short ChangeCounter
    | Long ChangeCounter
    | Cycles ChangeCounter
    | StartCount


type alias BoundedCounter =
    { label : String
    , num : Int
    , minN : Int
    , maxN : Int
    }


type ChangeCounter
    = Increment
    | Decrement

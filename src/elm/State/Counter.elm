module State.Counter exposing (init, update)

import Types exposing (..)


-- INIT


init : Int -> Int -> Int -> BoundedCounter
init cnt mx mn =
    BoundedCounter cnt mx mn



-- UPDATE


update : ChangeCounter -> BoundedCounter -> BoundedCounter
update msg model =
    let
        newNum =
            case msg of
                Increment ->
                    model.num + 1

                Decrement ->
                    model.num - 1
    in
        { model
            | num = clamp model.minN model.maxN newNum
        }

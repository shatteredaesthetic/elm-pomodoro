module State.Counter exposing (init, update)

import Types exposing (..)


-- INIT


init : String -> Int -> Int -> Int -> BoundedCounter
init lbl cnt mx mn =
    BoundedCounter lbl cnt mx mn



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

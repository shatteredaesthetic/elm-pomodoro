module View.Util exposing (..)

import Types exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (style)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


type alias Attr =
    ( String, String )


styleList : List (List Attr) -> Attribute ChangeCounter
styleList lists =
    style <| List.concat lists



-- STYLE


flexStyle : List Attr
flexStyle =
    [ "display" => "flex"
    ]


centerStyle : List Attr
centerStyle =
    [ "justify-content" => "center"
    , "align-items" => "center"
    ]

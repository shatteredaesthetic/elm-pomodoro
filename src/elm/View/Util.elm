module View.Util exposing (..)

import Types exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (style)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


type alias Attr =
    ( String, String )


styleList : List (List Attr) -> Attribute Msg
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


btnStyle : List Attr
btnStyle =
    [ "display" => "flex"
    , "flex" => "1"
    , "font-size" => "3em"
    , "cursor" => "pointer"
    , "justify-content" => "center"
    , "align-items" => "center"
    ]


stretchStyle : List Attr
stretchStyle =
    [ "width" => "65%"
    , "height" => "65%"
    ]


columnStyle : List Attr
columnStyle =
    [ "flex-direction" => "column" ]


relativeStyle : List Attr
relativeStyle =
    [ "position" => "relative" ]

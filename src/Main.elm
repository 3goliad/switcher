module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onMouseDown)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type Model
    = Unstarted
    | Started


init : () -> ( Model, Cmd Msg )
init _ =
    ( Unstarted, Cmd.none )



-- UPDATE


type Msg
    = Reset
    | Drag


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( Started, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    let
        header =
            h1 [] [ text "Switcher" ]

        resetButton t =
            button [ onClick Reset ] [ text t ]
    in
    main_ []
        (case model of
            Unstarted ->
                [ header, resetButton "Begin" ]

            Started ->
                [ header, gameBoard, resetButton "Reset" ]
        )


gameBoard =
    div [ class "gameboard" ] pieces


piece : Int -> Int -> Html Msg
piece x y =
    div [ class "piece" ]
        [ text (String.fromInt x ++ ", " ++ String.fromInt y) ]


row : Int -> Html Msg
row y =
    div [ class ("row-" ++ intName y) ]
        (List.map (\x -> piece x y) (List.range 1 9))


pieces : List (Html Msg)
pieces =
    List.map row (List.range 1 9)


intName : Int -> String
intName i =
    case i of
        1 ->
            "one"

        2 ->
            "two"

        3 ->
            "three"

        4 ->
            "four"

        5 ->
            "five"

        6 ->
            "six"

        7 ->
            "seven"

        8 ->
            "eight"

        9 ->
            "nine"

        _ ->
            "unk"

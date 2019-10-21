module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)



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
    div []
        [ h1 [] [ text "Switcher" ]
        , button [ onClick Reset ]
            [ text (resetText model) ]
        ]


resetText : Model -> String
resetText model =
    case model of
        Started ->
            "Reset"

        Unstarted ->
            "Begin"

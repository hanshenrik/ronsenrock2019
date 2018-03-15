port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, initializeJS () )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ div [ class "main" ]
            [ img [ src "/logo-2018.jpg", alt "RønsenRock-logo 2018"  ] []
            , div [ id "countdown" , attribute "data-date" "2018-06-05 12:00:00" ] []
            ]
        , footer [] [ text "✌️" ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }



-- SUBSCRIPTIONS


port initializeJS : () -> Cmd msg

port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Mapbox.Maps.SlippyMap as Mapbox
import Mapbox.Endpoint as Endpoint


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


mapboxToken : String
mapboxToken =
    "pk.eyJ1IjoiaGFuc2hlbnJpayIsImEiOiJjamV3NW1lamYwanllMndwNW11azRoa2ZmIn0.yiRRHbdHlHYxMlgRO-HnHw"

mapboxPosition : Maybe Mapbox.Position
mapboxPosition = Just (Mapbox.Position 0 0 0)

mapboxOptions : Maybe Mapbox.Options
mapboxOptions = Just (Mapbox.Options False True True True)

-- Embed a slippy map into your website and set Options, Hash and Size of the iframe.
embeddedSlippyMap : Html msg
embeddedSlippyMap =
    Mapbox.slippyMap Endpoint.dark mapboxToken mapboxOptions mapboxPosition (Mapbox.Size 500 500)

view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ div [ class "main" ]
            [ img [ src "/logo-2018.jpg", alt "RønsenRock-logo 2018"  ] []
            , h1 [] [ text "Hvor lenge er det til?" ]
            , div [ id "countdown" , attribute "data-date" "2018-06-05 12:00:00" ] []
            , h1 [] [ text "Hvem spiller?" ]
            , p [] [ text "Kommer..."]
            , h1 [] [ text "Hvor er det?" ]
            , div [ class "directions" ]
                [ div [ id "map" ] []
                , div []
                    [ h2 [] [ text "Med bil" ]
                    , p [] [ text "Kjør hit. Parker langs veien." ]
                    , h2 [] [ text "Med tog" ]
                    , p [] [ text "Toget til Eidsvoll stasjon. Sikkert noen du kan haike med derfra." ]
                    ]
                ]
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

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
        [ header [] [ img [ id "logo", src "/images/logo-2018.jpg", alt "RønsenRock-logo 2018"  ] [] ]
        , div [ class "main" ]
            [ div [ id "countdown" , attribute "data-date" "2018-06-05 12:00:00" ] []
            , h1 [] [ text "Program" ]
            , p [] [ text "Kommer..."]
            , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/stemning.jpg')" )] ]
                [ div [ class "caption" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section directions" ]
                [ div [ id "map" ] []
                , div []
                    [ h1 [] [ text "Hvor er det?" ]
                    , p [] [ text "Rønsenvegen 121, 2080 Eidsvoll" ]
                    , h3 [] [ text "Med bil" ]
                    , p [] [ text "Kommer du nordfra, er det greieste å kjøre av E6 ved Minnesund. Deretter følger du skilting til Vormsund (177). Etter ca. 5 kilometer sørover vil du se skilting til festivalområdet." ]
                    , p [] [ text "Kommer du sørfra, og du ikke er lokalkjent, er det greieste å late som om du kommer nordfra og følge den samme veibeskrivelsen." ]
                    , h3 [] [ text "Med tog" ]
                    , p []
                        [ text "I og med at Eidsvoll er NSBs navle, er det mange togavganger som stopper på Eidsvoll stasjon. Sjekk "
                        , a [ href "https://nsb.no", target "_blank" ] [ text "nsb.no" ]
                        , text " for detaljer."
                        ]
                    , p [] [ text "Når du har gått av på Eidsvoll stasjon (ikke Eidsvoll Verk!), er det fremdeles rundt 7 kilometer til du er framme. Kollektivtilbudet herfra er heller skralt, så her er alternativene taxi, venner med bil, sykkel eller å ta beina fatt." ]
                    , p []
                        [ text "Det er mange som kjører forbi stasjonen på vei til festivalen, så det er sikkert mulig å organisere samkjøring på "
                        , a [ href "https://facebook.com/events/1645171895567999", target "_blank" ] [ text "Facebook-eventet" ]
                        , text "."
                        ]
                    ]
                ]
            , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/skilt.jpg')" )] ]
                [ div [ class "caption" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Om festivalen"]
                , p [] [ text "Ideen til RønsenROCK dukket først opp på en av Jow Blob sine bandøvinger vinteren 2014. Alle band drømmer om et publikum, så hvorfor ikke arrangere en egen festival og booke seg sjæl? Dessuten: hvor vanskelig kan det være? Fredrik og Maria har hage med armslag og en sliten veranda som funker som scene, Halvor kjenner en fyr med svært anlegg og miksebord, mens Tea og Mario har flust med rockekompiser som sikkert vil komme og spille." ]
                , p [] [ text "Jow Blob ble oppløst året etter, så i dag arrangeres RønsenROCK av festivalsjef Halvor, og Maria og Fredrik som bor der. Festivalen er tuftet på good will, dugnadsånd og spleiselagprinsippet. Det overordnede målet er å legge til rette for en langhelg med ekte rockeglede, akkompagnert av teltliv og varmt øl i venners venners lag."]
                ]
            , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/bacon.jpg')" )] ]
                [ div [ class "caption" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Hvor mye koster det?"]
                , p [] [ text "RønsenROCK finansieres etter spleiselagprinsippet. Derfor oppfordrer vi alle til å bidra med 100,- per dag eller 200,- for festivalpass ved inngangen. Aller helst kæsj kontant, men Vipps funker også. I bytte mot bidraget får du et stilig festivalarmbånd. Men la det være klart: RønsenROCK gjør ikke forskjell på fattig og rik. Her er alle velkomne. Er du pengelens, kan du heller bidra med rock, roll og generelt god festivalstemning." ]
                , p [] [ text "100,- per dag eller 200,- for hele festivalen. Kontant eller Vipps til telefon: ", a [ href "tel:+4747364140" ] [ text "+47 47 36 41 40" ] ]
                , p [] [ text "Du kan også bidra i etterkant av festivalen på kontonummer 1208.67.27976." ]
                ]
            , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/tak2.jpg')" )] ]
                [ div [ class "caption" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Ofte stilte spørsmål" ]
                , h3 [] [ text "Kan jeg overnatte?" ]
                , p [] [ text "Jepp! Ta med telt, campingvogn, bilen eller hva du nå enn har å sove i. Det er god plass å campe på. De beste plassene blir tidlig okkupert, så dersom du trenger vatret underlag, bør du komme tidlig på torsdag." ]
                , h3 [] [ text "Hvilke fasiliteter finnes?" ]
                , p [] [ text "På festivalområdet finnes utedasser, vann, grill, førstehjelpsutstyr, godt med beinplass og lun sønnavind. Mat, drikke, varme klær og myggmiddel må du ta med sjøl." ]
                , h3 [] [ text "Hvordan får jeg tak i t-skjorte?" ]
                , p [] [ text "Vi har igjen trykket opp t-skjorter med ny, fet logo. Disse selges for kroner 200,- pr. stk. ved inngangen." ]
                , h3 [] [ text "Hvor mye koster det?" ]
                , p [] [ text "RønsenROCK er gratis for alle blide mennesker som bidrar til god festivalstemning. Vi oppfordrer likevel alle til å bidra til spleiselaget ved å betale 100,- per dag eller 200,- for festivalpass. Hvis du betaler får du dessuten et dritkult festivalarmbånd." ]
                ]
            , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/sofa.jpg')" )] ]
                [ div [ class "caption" ] [ text "Thomas Kvehaugen"] ]
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

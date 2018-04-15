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
        [ header [ id "header" ]
            [ div [ id "logo" ] []
            , h2 [ class "date" ] [ text "5. - 8. juli"]
            ]
        , div [ class "main" ]
            [ div [ id "countdown" , attribute "data-date" "2018-07-05 12:00:00" ] []
            , div [ class "section" ]
                [ table [ class "program" ]
                    [ tbody []
                        [ tr [] [ td [ colspan 2 ] [ h3 [] [ text "Torsdag 5. juli" ] ] ]
                        , tr []
                            [ td [ class "time" ] [ text "12:00" ]
                            , td [] [ text "Festivalområdet åpner!" ]
                            ]
                        , tr [] [ td [ colspan 2 ] [ h3 [] [ text "Fredag 6. juli" ] ] ]
                        , tr []
                            [ td [ class "time" ] [ text "17:00" ]
                            , td [] [ text "Tautrekking" ]
                            ]
                        , tr []
                            [ td [ class "time" ] [ text "19:00" ]
                            , td [] [ text "Konsertrekke #1" ]
                            ]
                        , tr [] [ td [ colspan 2 ] [ h3 [] [ text "Lørdag 7. juli" ] ] ]
                        , tr []
                            [ td [ class "time" ] [ text "12:00" ]
                            , td [] [ text "Konsertrekke #2" ]
                            ]
                        , tr []
                            [ td [ class "time" ] [ text "16:30" ]
                            , td [] [ text "Kåring av «beste camp»" ]
                            ]
                        , tr []
                            [ td [ class "time" ] [ text "17:00" ]
                            , td [] [ text "Båreløp" ]
                            ]
                        , tr []
                            [ td [ class "time" ] [ text "18:45" ]
                            , td [] [ text "Fellesbilde" ]
                            ]
                        , tr []
                            [ td [ class "time" ] [ text "19:00" ]
                            , td [] [ text "Konsertrekke #3" ]
                            ]
                        ]
                    ]
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/stemning-tk.jpg')" )] ]
                [ div [ class "attribution" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section artists" ]
                [ h1 [] [ text "Artister"]
                , div [ class "artists-list" ]
                    [ div [ class "artist", style [( "background-image", "url('/images/artists/sorgen.jpg')" )] ]
                        [ h3 [] [ text "Sorgen" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Med omtalelser som '(...) solos and instrumentation that could make Jimmy Page blush.' (James Davenport, Punktastic, 17.03.2016), 'Det er lite annet å si enn at om du ikke kommer i godt humør av dette er du en av de døveste menneskene i verden.' (Råkkfolk, 14.12.2017) og 'Blir i godt humør hver gang jeg hører på' (Balladepodden, 20.12.2017) har rockebandet ", h5 [ class "inline" ] [ text "Sorgen" ], text " rocket seg inn i hjertene til et ekslusivt lite knippe mennesker i Oslo-området. Nå sikter de på å rekke ut til et større knippe mennesker i Oslo-området, og spiller på AyeAyeClub!" ]
                        , p [] [ text "Sorgen er fire mennesker. Høye trommer, tung bass, stødig gitar og onanigitar. Lydbildet preges også av trestemt vokal med dialekt tilpasset låtenes individuelle uttrykk. Det går høyt, lavt, bredt og smalt, ofte i løpet av et eneste vers. Fint, stygt, slemt og snilt, pakket inn i et familievennlig format." ]
                        , p [] [ text "Link til et rockealbum: ", a [ href "http://phonofile.link/sushi-gutteklubb", target "_blank" ] [ text "phonofile.link/sushi-gutteklubb" ] ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/skamfuret-vaerbitt.jpg')" )] ]
                        [ h3 [] [ text "Skamfuret Værbitt" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Husbandet bestående av selveste festivallaget pluss en bror på trommer. Skamfura spiller fengende coverlåter du har hørt og sikkert ikke hørt. Uansett rocker det no jævelig!" ]
                        , p [] [ h5 [ class "inline" ] [ text "Skamfuret Værbitt" ], text " starter opp hele festivalen og ønsker at du er med å sparke i gang årets festival. Så sjekk oss ut!" ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/inglorious-retards.jpg')" )] ]
                        [ h3 [] [ text "Inglorious Retards" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Vi gleder oss stort over å annonsere at ", h5 [ class "inline" ] [ text "Inglorious Retards" ], text " kommer tilbake til RønsenROCK for fjerde år på rad! De foregående konsertene signert retardsa har av mange blitt regnet som de beste på RønsenROCK, og det er vanskelig å se for seg at årets gig skal bli noe dårligere." ]
                        , p [] [ text "Med egen penn skriver bandet at de er en «bedrukken trio fra Oslo med en rotete og variert blindfot innenfor punkens mange fjes som spiller egenkomponerte fylleviser tolket på finnmarkskt». De av dere som sliter med å skjønne hva det skal bety, kan sjekke ut plata de ga ut i 2015: ", a [ href "https://open.spotify.com/album/1wSpC9TS2rGfZyv18lkQ2P?si=iPqloOmISGmPPDKjOuvESQ" ] [ text "Den første føkkings plata." ] ]
                        , p [] [ text "Det skal bli spennende å se om trommis Trond 'T-bag' Riktor har lært seg å stå på hue og om Danny 'Rimjob' Nystad setter ny pers på sin spurt rundt våningshuset. Det viktigste er at sykkelhjelm og bastskjørt er på, og at Daniel holder seg unna stiger og svenske skuldre." ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/rainbowhead.jpg')" ), ( "background-position-y", "bottom" )] ]
                        [ h3 [] [ text "Rainbowhead" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Spacerock fra bygda!" ]
                        , p [] [ text "Lets have a spacejam." ]
                        , p [] [ h5 [ class "inline" ] [ text "Rainbowhead" ], text " er Henrik Høibraaten (gitar, vokal), Martin Haugen (bass), Nicolas Palacios (synth, gitar), Ole Mathias Sommerfelt (trommer)" ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/bucktooth-dan.jpg')" ), ( "background-position-y", "top" )] ]
                        [ h3 [] [ text "Bucktooth Dan" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ h5 [ class "inline" ] [ text "Bucktooth Dan" ], text " er en gitarist og sanger tidligere og fortsatt kjent for å være det samme i punkbandet Inglorious Retards." ]
                        , p [] [ text "Dette er liksom bare sologreia." ]
                        ]
                    , p [ style [("text-align", "center")] ] [ text "Flere artister kommer snart...!" ]
                    ]
                -- , iframe [ id "spotify-plugin", src "https://open.spotify.com/embed/user/shenrik/playlist/3WNyCI7Eok5aS12zoAxHXF", seamless True ] []
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/maria-skilt-ss.jpg')" )] ]
                [ div [ class "attribution" ] [ text "Siri Saugstad"] ]
            , div [ class "section directions" ]
                [ div [ id "map" ] []
                , div []
                    [ h1 [] [ text "Hvor er det?" ]
                    , p [] [ text "Rønsenvegen 121, 2080 Eidsvoll" ]
                    , h4 [] [ text "Med bil" ]
                    , p [] [ text "Kommer du nordfra, er det greieste å kjøre av E6 ved Minnesund. Deretter følger du skilting til Vormsund (177). Etter ca. 5 kilometer sørover vil du se skilting til festivalområdet." ]
                    , p [] [ text "Kommer du sørfra, og du ikke er lokalkjent, er det greieste å late som om du kommer nordfra og følge den samme veibeskrivelsen." ]
                    , h4 [] [ text "Med tog" ]
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
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/tautrekking2-tk.jpg')" )] ]
                [ div [ class "attribution" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Om festivalen"]
                , p [] [ text "Ideen bak RønsenROCK dukket først opp på en bandøving i 2014. Alle band drømmer om et stort publikum, så hvorfor ikke sette Eidsvoll på kartet med tidenes rockefestival, og booke seg sjæl med i giggen? Dessuten: Hvor vanskelig kan det være å arrangere festival? Sommeren 2015 ble scene og utedasser bygget, og vi var i gang. Det viste seg fort at det heller ikke var umulig å finne en haug med rockere som ville komme å spille, og RønsenROCK var offisielt!" ]
                , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/festivalgjengen-tep.jpg')" ), ( "background-position", "top" )] ]
                    [ div [ class "attribution" ] [ text "Tom Erik Paulsen / EUB"] ]
                , div [ class "caption" ] [ text "RønsenROCK festivallag, bestående av Fredrik, Maria og Halvor" ]
                , p [] [ text "Da det var duket for oppfølgeråret i 2016 måtte scenen ha en liten makeover, og er det noe dette festivallaget ikke mangler er det dugnadsånd! Venner og bekjente, frivillige og familie stilte opp og hjalp arrangørene med ny scene, salgsbu, hjemmesnekra ølkasser som går til banda som spiller, grillplass som brukes hyppig gjennom helga, hengekøyer, utvidet campområde, volleyballnett, og mye, mye mer! Alt for å gjøre denne helga helt spesiell. Festivalen er tuftet på goodwill og det overordnede målet er å legge til rette for en langhelg med ekte rockeglede, sjukt bra musikk, sosialt samvær og varmt øl. Og målet blir nådd hvert år med god margin."]
                , div [ class "divider-img-wrapper", style [( "background-image", "url('/images/lydmann-tk.jpg')" )] ]
                    [ div [ class "attribution" ] [ text "Thomas Kvehaugen"] ]
                , div [ class "caption" ] [ text "RønsenROCKs elskede lydmann, Håkon"]
                , p [] [ text "Festivalen har vokst og fortsetter å vokse. I prinsippet er dette en gratis festival, men arrangørene setter pris på økonomisk støtte fra deltakerne for å kunne opprettholde og utvikle festivalen videre. Det er viktig å understreke at RønsenROCK ikke hadde vært det det er i dag uten hjelp og støtte fra venner, familie og deltakere, og at dette er noe festivallaget setter ekstremt stor pris på. Ta turen, sjekk det ut, du vil ikke angre!"]
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/bacon-tk.jpg')" )] ]
                [ div [ class "attribution" ] [ text "Thomas Kvehaugen"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Hvor mye koster det?"]
                , p [] [ text "RønsenROCK finansieres etter spleiselagprinsippet. Derfor oppfordrer vi alle til å bidra med 150,- per dag eller 250,- for festivalpass ved inngangen. Aller helst kæsj kontant, men Vipps funker også. I bytte mot bidraget får du et stilig festivalarmbånd. Men la det være klart: RønsenROCK gjør ikke forskjell på fattig og rik. Her er alle velkomne. Er du pengelens, kan du heller bidra med rock, roll og generelt god festivalstemning." ]
                , p [] [ text "150,- per dag eller 250,- for hele festivalen. Kontant eller Vipps." ]
                , p [] [ text "Du kan også bidra i etterkant av festivalen på kontonummer 8475 10 75285." ]
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/tak4-tk.jpg')" ), ( "background-position", "bottom" )] ]
                [ div [ class "attribution" ] [ text "Tom Erik Paulsen / EUB"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Ofte stilte spørsmål" ]
                , h4 [] [ text "Kan jeg overnatte?" ]
                , p [] [ text "Jepp! Ta med telt, campingvogn, bilen eller hva du nå enn har å sove i. Det er god plass å campe på. De beste plassene blir tidlig okkupert, så dersom du trenger vatret underlag, bør du komme tidlig på torsdag." ]
                , h4 [] [ text "Hvilke fasiliteter finnes?" ]
                , p [] [ text "På festivalområdet finnes utedasser, vann, grill, førstehjelpsutstyr, godt med beinplass og lun sønnavind. Mat, drikke, varme klær og myggmiddel må du ta med sjøl." ]
                , h4 [] [ text "Hvordan får jeg tak i t-skjorte?" ]
                , p [] [ text "Vi har igjen trykket opp t-skjorter med ny, fet logo. Disse selges for kroner 200,- pr. stk. ved inngangen." ]
                , h4 [] [ text "Hvor mye koster det?" ]
                , p [] [ text "RønsenROCK er gratis for alle blide mennesker som bidrar til god festivalstemning. Vi oppfordrer likevel alle til å bidra til spleiselaget ved å betale 150,- per dag eller 250,- for festivalpass. Hvis du betaler får du dessuten et dritkult festivalarmbånd." ]
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/sofa-tk.jpg')" )] ]
                [ div [ class "attribution" ] [ text "Thomas Kvehaugen"] ]
            ]
        , footer [] [ text "🔨 av ", a [ href "https://github.com/hanshenrik", target "_blank" ] [ text "hanshenrik" ] ]
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

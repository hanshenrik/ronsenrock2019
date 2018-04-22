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
        [ div [ class "ie ie-notice" ]
            [ p [] [ text "Psst! Ser at du bruker ", strong [] [ text "Internet Explorer" ], text " :|" ]
            , p [] [ text "Den nettleseren er skikkelig lei å ha med å gjøre :(" ]
            , p [] [ text "Så hvis du vil se hvordan sida ", em [] [ text "egentlig" ], text " skal se ut - sjekk den gjerne ut i en annen nettleser :)" ]
            , p []
                [ text "For eksempel en av disse:"
                , ul []
                    [ li [] [ a [ href "https://www.google.com/chrome" ] [ text "Google Chrome" ] ]
                    , li [] [ a [ href "https://www.mozilla.org/en-US/firefox/new/" ] [ text "Mozilla Firefox" ] ]
                    , li [] [ a [ href "https://www.opera.com/" ] [ text "Opera" ] ]
                    , li [] [ a [ href "https://www.microsoft.com/en-us/windows/microsoft-edge" ] [ text "Microsoft Edge" ] ]
                    ]
                ]
            ]
        , header [ id "header" ]
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
                [ h1 [] [ text "Hvem spiller?"]
                , div [ class "artists-list" ]
                    [ div [ class "artist", style [( "background-image", "url('/images/artists/sorgen.jpg')" )] ]
                        [ h3 [] [ text "Sorgen" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Med omtalelser som '(...) solos and instrumentation that could make Jimmy Page blush.' (James Davenport, Punktastic, 17.03.2016), 'Det er lite annet å si enn at om du ikke kommer i godt humør av dette er du en av de døveste menneskene i verden.' (Råkkfolk, 14.12.2017) og 'Blir i godt humør hver gang jeg hører på' (Balladepodden, 20.12.2017) har rockebandet ", h5 [ class "inline" ] [ text "Sorgen" ], text " rocket seg inn i hjertene til et ekslusivt lite knippe mennesker i Oslo-området. Nå sikter de på å rekke ut til et større knippe mennesker i Oslo-området!" ]
                        , p [] [ text "Sorgen er fire mennesker. Høye trommer, tung bass, stødig gitar og onanigitar. Lydbildet preges også av trestemt vokal med dialekt tilpasset låtenes individuelle uttrykk. Det går høyt, lavt, bredt og smalt, ofte i løpet av et eneste vers. Fint, stygt, slemt og snilt, pakket inn i et familievennlig format." ]
                        , p [] [ text "Link til et rockealbum: ", a [ href "http://phonofile.link/sushi-gutteklubb", target "_blank" ] [ text "phonofile.link/sushi-gutteklubb" ] ]
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
                    , div [ class "artist", style [( "background-image", "url('/images/artists/thundering-voices.jpg')" )] ]
                        [ h3 [] [ text "Thundering Voices" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ h5 [ class "inline" ] [ text "Thundering Voices" ], text " er et band som tviholder på den gamle rocken med en hånd, og samtidig strekker den andre ut for moderne rock med innslag av blues, samt groovy og funky vibber. Bandet holder til i Eidsvoll, og musikken beveger seg fra hardtslående og etablerte band som Thin Lizzy, AC/DC og Rival Sons - til groovy og bluesy artister som Phillip Sayce."
                        , p [] [ text "Medlemmene i gruppa kommer fra rake motsetninger innenfor musikkuniverset, som sprer seg fra tung metall og pop-punk, til tradisjonell rock. Til sammen tilføyer de hvert sitt personlige touch til sangene, samtidig som de har respekt for hvordan en låt av tungvekterne i musikkbransjen skal fremføres - med punktlighet og innlevelse. Å bevare feel-en og personligheten til en sang er essensielt - men samtidig, står ikke dette i veien for å angripe låter fra andre vinkler og blåse liv i andre oppbygninger, introer, soloer og avslutninger." ] ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/konger-og-keisere.jpg')" ), ( "background-position-y", "top" )] ]
                        [ h3 [] [ text "Konger og Keisere" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ h5 [ class "inline" ] [ text "Konger og Keisere" ], text " er en trio ifra Drammen som spiller ektefølt beinhard ny norsk rock, godt variert innenfor sjangeren. Gutta har nå konspirert sammen i nærmere 4 år og har etter hvert utviklet et bredt utvalg av låter som sitter som dritt i kram snø. Elementer som funk, blues og prog ispedd tunge riff og fengende linjer blir servert i en utrolig kul kombinasjon av forskjellige stilarter som inviterer til ekstremt høy ølglassføring." ]
                        , p [] [ text "Når Konger og Keisere da i tillegg leverer show på show preget av skyhøy energi og genuin spilleglede hersker det ingen tvil om at der de er, der må du være!" ]
                        , p [] [ text "Sjekk de ut på ", a [ href "http://spoti.fi/2FUCulT", target "_blank" ] [ text "Spotify" ], text " og ", a [ href "http://bit.ly/2FWfVxn", target "_blank" ] [ text "Facebook" ], text "." ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/darlig-hjort.jpg')" )] ]
                        [ h3 [] [ text "Dårlig Hjort" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ h5 [ class "inline" ] [ text "Dårlig Hjort" ], text " er en æddabædda powertrio fra Oslo, hvis alle medlemmer har vokst opp i en stereotypisk Disneyfilm; ingen fedre som stakk av, ingen mødre på trygd, ingen brekte ben, men alltid den ene jenta som slapp unna eller sommerferien med gutta som skulle vart lenger. Musikken gjenspeiler 90-tallets ska/skate og poppunk-kultur, med innflytelse fra dertilhørende labler og aktiviteter. Med skrubbsår på kneet og capsen plassert godt bak frem er Dårlig Hjort en tirade av kleine, men flerstemte, og humoristiske historier, fremført i melodiske up-beat låter som får frem Benny Gullfotskoa i en hver sliten veteran." ]
                        , p [] [ text "Bandet slapp debutalbumet ", a [ href "https://open.spotify.com/album/5tWgxPysq6r6enDxaq7XTK?si=WWtovgMKS3e_izT3BQuzuw", target "_blank" ] [ text "Kunne vært verre" ], text " i januar 2016 på en utsolgt lillescene (+140 pax, Parkteatret, Oslo) og har bemerka seg som et høykultivert punkensemble på den norske konsertscena siden: Høyenergiske shows med fokus på kleine vitser, mye allsang, nok av vreng og mer til, og alt dette i kombinasjon med putekriger, papirfly og crowdsurfs. Oppfølgende EP «...eller penga tilbake» ble sluppet okt-17 til gode kritikker (7/10 Evig Lyttar, 7/10 Musikknyheter, 4/6 Norway Rock Magazine) etterfulgt av norgesturne. Det hele ble avsluttet på et utsolgt Revolver (+150 pax) i Oslo." ]
                        , p [] [ text "Tekstene sirkulerer rundt tidvis enkle og tidvis vanskelige temaer som preger en gammel ungdoms eller tidlig voksens hverdag - kanskje aller mest overgangen mellom de to. Det dreier seg om forelskelse, fest og fyllesjuke, men også presset om jobb, karriere, forventninger og plikter som følger med. «Ofte skulle vi ønske vi bare kunne rømme landet og ligge i ei hengekøye på en øde øy med sola i øya. Samtidig anerkjenner vi at det er mange som har det ganske mye kjipere enn oss. Det kunne vært verre.»" ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/norrona-band.jpg')" )] ]
                        [ h3 [] [ text "Norrøna Band" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ h5 [ class "inline" ] [ text "Norrøna Band" ], text " er noe så herskapelig som et husband som lirer av seg gamle slagere som får morra di til å drømme seg tilbake til den frigjorte Woodstock tida og dattera di til de glade britpop dager den gang SoWhat eksisterte. Denne brokede gjengen av kollegaer har med seg jazz-, punk, og rock i bagasjen og deler en evig drøm om å være rockestjerner. De leverer en hit-parade som de fleste vil digge." ]
                        ]
                    , div [ class "artist", style [( "background-image", "url('/images/artists/victor-og-dakota.jpg')" )] ]
                        [ h3 [] [ text "Victor og Dakota" ]
                        , div [ class "show-more-button" ] []
                        ]
                    , div [ class "artist-bio" ]
                        [ p [] [ text "Easy and chill!" ]
                        ]
                    , p [ style [("text-align", "center")] ] [ text "Resten av artistene slippes snart...!" ]
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
                [ h1 [] [ text "Hva er det?"]
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
                , p [] [ h5 [ class "inline" ] [ text "150,-" ], text " per dag eller ", h5 [ class "inline" ] [ text "250,-" ], text " for hele festivalen. Kontant eller Vipps." ]
                , p [] [ text "Du kan også bidra i etterkant av festivalen på kontonummer 8475 10 75285." ]
                ]
            , div [ class "divider-img-wrapper-full", style [( "background-image", "url('/images/tak4-tk.jpg')" ), ( "background-position", "bottom" )] ]
                [ div [ class "attribution" ] [ text "Tom Erik Paulsen / EUB"] ]
            , div [ class "section" ]
                [ h1 [] [ text "Andre spørsmål" ]
                , h4 [] [ text "Kan jeg overnatte?" ]
                , p [] [ text "Jepp! Ta med telt, campingvogn, bilen eller hva du nå enn har å sove i. Det er god plass å campe på. De beste plassene blir tidlig okkupert, så dersom du trenger vatret underlag, bør du komme tidlig på torsdag." ]
                , h4 [] [ text "Hvilke fasiliteter finnes?" ]
                , p [] [ text "På festivalområdet finnes utedasser, vann, grill, førstehjelpsutstyr, godt med beinplass og lun sønnavind. Mat, drikke, varme klær og myggmiddel må du ta med sjøl." ]
                , h4 [] [ text "Hvordan får jeg tak i t-skjorte?" ]
                , p [] [ text "Vi har igjen trykket opp t-skjorter med ny, fet logo. Disse selges for kroner 200,- pr. stk. ved inngangen." ]
                , h4 [] [ text "Blir det fett?" ]
                , p [] [ text "Ja." ]
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

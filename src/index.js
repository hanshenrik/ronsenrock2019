import "./styles/main.css";
import { Elm } from "./Main.elm";
import registerServiceWorker from "./registerServiceWorker";

var app = Elm.Main.init({ node: document.getElementById("root") });

// registerServiceWorker();

// Initilize JS stuff when Elm is ready
app.ports.initializeJS.subscribe(function () {
  $("#countdown").TimeCircles({
    animation: "smooth",
    circle_bg_color: "#dedede",
    bg_width: 0.2,
    fg_width: 0.05,
    time: {
      Days: {
        text: "dager",
        color: "#95ea95",
        show: true
      },
      Hours: {
        text: "timer",
        color: "#95ea95",
        show: true
      },
      Minutes: {
        text: "minutter",
        color: "#95ea95",
        show: true
      },
      Seconds: {
        text: "sekunder",
        color: "#95ea95",
        show: true
      }
    }
  });

  // Initialize Mapbox
  mapboxgl.accessToken =
    "pk.eyJ1IjoiaGFuc2hlbnJpayIsImEiOiJjamV3NW1lamYwanllMndwNW11azRoa2ZmIn0.yiRRHbdHlHYxMlgRO-HnHw";
  var center = [11.256755, 60.368553];
  var map = new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/mapbox/streets-v10?optimize=true",
    center: center,
    zoom: 10
  });

  var directions = new MapboxDirections({
    accessToken: mapboxgl.accessToken,
    unit: "metric"
  });

  map.addControl(directions, "top-left");
  map.addControl(new mapboxgl.NavigationControl(), "top-left");
  map.addControl(new mapboxgl.FullscreenControl(), "top-left");

  map.on("load", () => {
    directions.setDestination("Rønsenvegen 121, 2080 Eidsvoll");
  });

  // Open/close artist bio when clicking artist image
  $(".artist").click(function () {
    $(this).toggleClass("open");
    $(this)
      .nextAll(".artist-bio")
      .first()
      .slideToggle("fast");
    $(this)
      .find(".show-more-button")
      .first()
      .toggleClass("open");
  });

  $(".event").click(function () {
    $(this)
      .nextAll(".event-info")
      .first()
      .slideToggle("fast");
    $(this)
      .find(".show-more-button")
      .first()
      .toggleClass("open");
  });

  // Set the header height based on the initial window height to avoid URL address bar show/hide
  // change the height of the header, making the whole page jump annoyingly
  $("#header").css("height", $(window).height());
});

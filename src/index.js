import './styles/main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

var app = Main.embed(document.getElementById('root'));

registerServiceWorker();

// Initilize JS stuff when Elm is ready
app.ports.initializeJS.subscribe(function () {
  $('#countdown').TimeCircles({
    animation: 'smooth',
    circle_bg_color: '#dedede',
    bg_width: 0.2,
    fg_width: 0.05,
    time: {
      Days: {
        text: 'dager',
        color: '#95ea95',
        show: true
      },
      Hours: {
        text: 'timer',
        color: '#95ea95',
        show: true
      },
      Minutes: {
        text: 'minutter',
        color: '#95ea95',
        show: true
      },
      Seconds: {
        text: 'sekunder',
        color: '#95ea95',
        show: true
      }
    }
  });

  // Initialize Google Map
  const mapDiv = document.getElementById('map');
  const position = new google.maps.LatLng(60.368553, 11.256755);
  const mapOptions = {
    zoom: 10,
    center: position,
  };
  const gmap = new google.maps.Map(mapDiv, mapOptions);
  const marker = new google.maps.Marker({
    position: position,
    map: gmap,
  });

  // Open/close artist bio when clicking artist image
  $('.artist').click(function() {
    $(this).nextAll('.artist-bio').first().slideToggle('fast');
    $(this).find('.show-more-button').first().toggleClass('open');
  })

  // Set the header height based on the initial window height to avoid URL address bar show/hide
  // change the height of the header, making the whole page jump annoyingly
  $('#header').css('height', $(window).height());
});

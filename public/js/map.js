Vue.component('mapping' , {
  template: `
    <section class="hero is-light is-light" style="height:600px">
      <div style="height:100%; width:100%">
        <div id="map" style="height:100%; width:50%"></div>
      </div>
    </section>
  `
});

function initMap(lat,lng) {
  var marker = {lat:  13.79184, lng: 100.4236};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: marker,
    scrollwheel: false
  });
  var marker = new google.maps.Marker({
    position: marker,
    map: map
  });
}

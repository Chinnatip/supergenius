function initMap(lat,lng) {
  var marker = {lat:  13.79184, lng: 100.4236};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: marker
  });
  var marker = new google.maps.Marker({
    position: marker,
    map: map
  });
}

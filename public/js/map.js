Vue.component('mapping' , {
  template: `
  <section class="_hero_map hero is-light is-light" style="height:600px">
    <div class="content">
      <div id="map" ></div>
      <div class="_contact">
        <h1>Contact us</h1>
        <h2 v-for="m in map">
          <span class="head">{{m.head}}</span>
          <a :href="m.url" class="content">{{m.content}}</a>
        </h2>
      </div>
    </div>
  </section>
  `,
  props: ['map']
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

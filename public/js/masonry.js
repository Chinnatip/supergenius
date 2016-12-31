console.log('this is masonry');

Vue.component('masonry',{
  //template: '#mason-template',
  template: `
    <div id="mason-container" class="container">
      <span v-for="m in masons">
        <div class="card" style="display:inline-block; margin: 12px 8px">
          <div class="card-image">
            <figure class="image is-4by3">
              <img :src="m.image" alt="">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-32x32">
                  <img :src="m.profile" alt="Image">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-5">{{m.name}}</p>
                <p class="subtitle is-6">{{m.address}}</p>
              </div>
            </div>
            <div class="content">
              {{m.desc}}
              <br>
              <small>{{m.date}}</small>
            </div>
          </div>
        </div>
      </span>
    </div>
  `,
  props: ['masons']
});

Vue.component('masonry',{
  //template: '#mason-template',
  template: `
  <section class="hero is-light _hero_mason">
    <div class="container _mason_container">
      <h1 class="title">{{mason.title}}</h1>
      <h2 class="subtitle">{{mason.desc}}</h2>
      <span v-for="m in mason.lists">
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
  </section>
  `,
  props: ['mason']
});

Vue.component('navBar',{
  // sample
  // <nav-bar   :nav="nav" :body="body" ></nav-bar>
  template: `
  <div class="hero-head">
    <header class="nav">
      <div class="container">
        <div class="nav-left">
          <a :href="nav.brandLink" class="nav-item">
            <img :src="nav.brand" alt="" style="height: 33px;">
          </a>
        </div>
        <div class="nav-right nav-menu">
            <a class="nav-item"
              v-for="l in nav.links"
              :href="l.link"
              :target="l.target"
              :class="{active : isActive( active , l.controller )}"
            >
              {{l.title}}
            </a>

          <span class="nav-item" v-if="dashboard">

            <a v-if="role == 'admin'" :href="nav.backLink.link" class="button is-inverted" v-bind:class="[body.theme]">
              <span class="icon">
                <i class="fa" v-bind:class="[nav.backLink.icon]"></i>
              </span>
              <span>{{nav.backLink.title}}</span>
            </a>
            <a v-else href="#" class="button is-inverted is-info">
              <span class="icon">
                <i class="fa" v-bind:class="[nav.backLink.icon]"></i>
              </span>
              <span>Profile</span>
            </a>
          </span>
          <span class="nav-item" v-else >
            <a target="" href="/users/sign_in" class="button is-inverted" v-bind:class="[body.theme]">
              <span class="icon">
                <i class="fa" v-bind:class="[nav.backLink.icon]"></i>
              </span>
              <span>Login</span>
            </a>
          </span>
        </div>
      </div>
    </header>
  </div>
  `,
  props: ['nav','body','active','dashboard','role'],
  methods: {
    isActive: function( a,b ) {
      if (a == b) {
        return 'active'
      }
    }
  },
});

Vue.component('heroBody',{
  // sample
  // <!-- hero-body :text="body"></hero-body -->
  template: `
    <div class="hero-body">
      <div class="container has-text-centered">
        <h1 class="title">{{text.title}}</h1>
        <h2 class="subtitle">{{text.sub}}</h2>
      </div>
    </div>
  `,
  props: ['text']
});


Vue.component('heroLevel',{
  template: `
    <section class="hero is-primary">
      <div class="hero-body">
        <div class="columns has-text-centered">
          <div class="column">
            <span class="title">{{title}}</span>
            <a target="_blank" :href="url" class="button is-inverted">
              <span>{{button}}</span>
            </a>
          </div>
        </div>
      </div>
    </section>
  `,
  props: ['title','button','url']
});

Vue.component('heroGrid',{
  template: `
  <section class="hero is-light _hero_grid">
    <div class="hero-body">
      <div class="container has-text-centered">
        <h1 class="title">{{grid.title}}</h1>
        <h2 class="subtitle">{{grid.desc}}</h2>
        <div class="columns">
          <div class="column" v-for="g in grid.lists">
            <img :src="g.image" alt="">
            <h2>{{g.head}}</h2>
            <h3>{{g.detail}}</h3>
          </div>
        </div>
      </div>
    </div>
  </section>
  `,
  props: ['grid']
});

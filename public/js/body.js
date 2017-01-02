Vue.component('navBar',{
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
          <span v-for="l in nav.links" style="display: flex; align-items: center">
            <a :href="l.link" target="_blank" class="nav-item">
              {{l.title}}
            </a>
          </span>
          <span class="nav-item">
            <a target="_blank" :href="nav.backLink.link" class="button is-inverted" v-bind:class="[body.theme]">
              <span class="icon">
                <i class="fa" v-bind:class="[nav.backLink.icon]"></i>
              </span>
              <span>{{nav.backLink.title}}</span>
            </a>
          </span>
        </div>
      </div>
    </header>
  </div>
  `,
  props: ['nav','body']
});

Vue.component('heroBody',{
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

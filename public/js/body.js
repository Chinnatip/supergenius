Vue.component('navBar',{
  // sample
  // <nav-bar   :nav="nav" :body="body" ></nav-bar>
  template: `
  <div class="hero-head" id="navbar" >
    <header class="nav">
      <div class="container">
        <div class="nav-left">
          <a :href="nav.brandLink" class="nav-item">
            <img :src="nav.brand" alt="" style="height: 28px; max-height: inherit;">
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

          <span class="nav-item" v-if="login">
            <a v-if="role == 'admin'" href="/dashboard/index" class="button is-inverted" v-bind:class="[body.theme]">
              <span class="icon"> <i class="fa" v-bind:class="[nav.backLink.icon]"></i> </span>
              <span>Dashboard</span>
            </a>
            <div class="_with_sub_item">
              <a class="button is-inverted is-info">
                <span>Profile</span>
              </a>
              <ul class="_sub_nav_item" >
                <li><a href="/home/index">Manage Profile</a></li>
                <!-- li><a  href="/users/sign_out">logout</a></li -->
                <li><a @click="logout" >logout</a>
              </ul>
            </div>
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
  props: ['nav','body','active','login','role','controller'],
  methods: {
    isActive: function( a,b ) {
      if (a == b) {
        return 'active'
      }
    },
    logout: function(){
      $.post('/users/sign_out',"_method=delete", function(){
        window.location = '/home/index' ;
      });
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

Vue.component('hero-body-split',{
  // sample
  // <!-- hero-body :text="body"></hero-body -->
  template: `
    <div class="hero-body _body_split">
      <div class="container">
        <div class="split">
          <h1 class="title">{{text.title}}</h1>
          <h2 class="subtitle">{{text.sub}}</h2>
          <a class="button" :href="text.url">{{text.link}}</a>
        </div>
        <div class="square">
          <div class="quote">PCL</div>
          <div class="price">80.70 (THB)</div>
          <div class="change">
            CHANGE (%) <br>
            -0.21 (1.25%)
          </div>
        </div>
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

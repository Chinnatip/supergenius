Vue.component('navBar',{
  // sample
  // <nav-bar   :nav="nav" :body="body" ></nav-bar>
  template: `
  <div :class="'hero-head' + [dashboard ? 'dashboard' : ''] " id="navbar" >
    <header class="nav">
      <div class="container">
        <div class="nav-left">
          <a :href="nav.brandLink" class="nav-item">
            <img :src="nav.brand" alt="" style="height: 30px; margin-top:4px; max-height: inherit;">
          </a>
        </div>
        <div class="nav-right nav-mobi-show">
          <a @click="toggleNav">
            <i class="fa fa-bars"></i>
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
          <span class="inherit-nav" v-if="login">
            <a v-if="ustack == 'false'" class="nav-item ">สวัสดี {{user}}</a>
            <!-- a v-else class="nav-item user-name">สวัสดี {{user}}</a -->
            <a v-if="role == 'teacher' || role == 'admin'" href="/dashboard/index" class="nav-item">
              <span class="icon"> <i class="fa" v-bind:class="[nav.backLink.icon]"></i> </span>
              <span>Dashboard</span>
            </a>
            <a @click="logout" class="nav-item">
              <span class="icon"> <i class="fa" v-bind:class="[nav.logout.icon]"></i> </span>
              <span>ออกจากระบบ</span>
            </a>
          </span>
          <span  class="inherit-nav" v-else >
            <a target="" href="/users/sign_in" class="nav-item">
              <span class="icon">
                <i class="fa" v-bind:class="[nav.login.icon]"></i>
              </span>
              <span>เข้าสู่ระบบ</span>
            </a>
          </span>
        </div>
      </div>
    </header>
  </div>
  `,
  data: function(){
    return{}
  },
  props: ['nav','body','active','login','role','controller','user','ustack','dashboard'],
  methods: {
    isActive: function( a,b ) {
      if (a == b) {
        return 'active'
      }
    },
    logout: function(){
      $.post('/users/sign_out',"_method=delete", function(){
        window.location = '/' ;
      });
    },
    toggleNav: function(){
      var display = $('.nav-menu').css('display');
      if ( display == 'none') {
        $('.nav-menu').css("display","block");
      }else{
        $('.nav-menu').css("display","none");
      }
    },
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
    <div class="hero-body _body_split _mini-splitter">
      <div class="container">
        <div class="split _dark-round-split">
          <h1 class="title">{{text.title}}</h1>
          <h2 class="subtitle">{{text.sub}}</h2>
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

Vue.component('heroSlider',{
  template: `
    <div class="_hero_body_slider ok">
      <div class="arrow-picker">
        <a @click="tabs(-1)" class="pick"> < </a>
        <a @click="tabs(1)" class="pick">  > </a>
      </div>
      <div class="slider-picker">
        <span v-for="s in slider">
          <span v-if="slider.length > 1">
            <a href="#" v-on:click="checkActive( s.tab )" v-bind:class="{'active': isActive( s.tab )}"></a>
          </span>
        </span>
      </div>
      <span v-for="s in slider">
        <div class="hero-body" v-show="isActive( s.tab )">
          <div class="container has-text-centered">
            <h1 class="title">{{s.title}}</h1>
            <h2 class="subtitle">{{s.subtitle}}</h2>
          </div>
        </div>
      </span>
    </div>
  `,
  props: ['slider','choice'],
  methods: {
    isActive: function(val){
      return this.choice === val ;
    },
    checkActive: function(val){
      console.log(val);
      this.choice = val;
    },
    tabs: function(val){
      var array = this.slider ;
      var grand = array.length - 1  ;
      var sel = 0 ;
      for (var i = 0; i < array.length; i++) {
        if (this.choice == array[i]['tab']) {
          sel = i ;
        }
      }
      var comp = sel + val ;
      if (comp < 0) {
        this.choice = array[grand]['tab'];
      }else if (comp > grand) {
        this.choice = array[0]['tab'];
      }else {
        this.choice = array[comp]['tab'];
      }
    }
  }
});

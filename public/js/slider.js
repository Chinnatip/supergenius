// <!-- hero-slider :slider="slider" :choice="choice"></hero-slider -->
Vue.component('heroSlider',{
  template: `
    <div class="_hero_body_slider ok" id="body_content">
      <div class="arrow-picker">
        <a @click="tabs(-1)" class="pick"> < </a>
        <a @click="tabs(1)" class="pick">  > </a>
      </div>
      <div class="slider-picker">
        <span v-for="s in slider">
          <span v-if="slider.length > 1">
            <a v-on:click="checkActive( s.tab )" v-bind:class="{'active': isActive( s.tab )}"></a>
          </span>
        </span>
      </div>
      <span v-for="s in slider">
        <div class="hero-body _body_split" v-show="isActive( s.tab )" :style="{background: 'url(' + s.image + ') no-repeat center center fixed' , backgroundSize: 'cover'}">
          <div class="container">
            <div class="split _dark-round">
              <h1 class="title">{{s.title}}</h1>
              <h2 class="subtitle">{{s.subtitle}}</h2>
              <a class="button" :href="s.url">{{s.link}}</a>
            </div>
            <div style="flex-grow:1"></div>
            <div class="square">
              <div class="quote">100%</div>
              <div class="price">สอบติด 5ปีซ้อน</div>
              <div class="change">
                สถิติที่เราภูมิใจ <br>
                <span style="font-style: italic">ครูวิน สอนเลข</span>
              </div>
            </div>
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
      //console.log(val);
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

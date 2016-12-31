Vue.component('sampling',{
  //template: '#sampling',
  template: `
    <div class="">
      this is component <br>
      {{fig}} <br>
      I will count on this number ==> {{counter}}
    </div>
  `,
  props: ['fig','counter']
});

var sampling = new Vue({
  el: '#app-sample',
  data: {
    message: 'hello world',
    notice: 'now you see me!?',
    counts: 0
  },
  methods:{
    addCounts: function(){
      this.counts += 1
    },
    minusCounts: function(){
      if (this.counts >= 1) {
        this.counts -= 1
      }
    },
    cleanCounts: function(){
      this.counts = 0
    }
  }
});

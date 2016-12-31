console.log('run file voter.js from public/js/voter.j');

Vue.component('post',{
  //template: '#post-template',
  template: `
    <li class="list-group-item">
      <button @click="upvote" type="button">up</button>
      <span class="is-primary">{{ vote }}</span>
      <button @click="downvote" type="button">down</button>
      <a>{{ post.title }}</a>
    </li>
  `,
  props:['post'],
  data: function(){
    return {
      upvoted: false,
      downvoted: false
    }
  },
  methods: {
    upvote: function () {
      this.upvoted = !this.upvoted;
      this.downvoted = false;
    },
    downvote: function () {
      this.downvoted = !this.downvoted;
      this.upvoted = false;
    }
  },
  computed: {
   vote: function () {
     if (this.upvoted) {
       return this.post.vote + 1;
     } else if (this.downvoted) {
       return this.post.vote - 1;
     } else {
       return this.post.vote;
     }
   }
 }
});

var vms = new Vue({
  el: '#vote',
  data: {
    posts: [{
        title: 'fnviermeokcmeore',
        vote: 15
    },{
        title: "Try out the upvoting, it works, I promise",
        vote: 53
    },
    {
        title: "coligo is the bomb!",
        vote: 10
    }]
  }
});

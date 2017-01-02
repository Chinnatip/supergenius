Vue.component('footer-copy',{
  template: `
  <footer class="footer">
    <div class="container">
      <div class="content has-text-centered">
        <p>
          copyright Ⓒ {{year}} <strong>{{company}}</strong> , all right reserved.
        </p>
      </div>
    </div>
  </footer>
  `,
  props:['year','company']
});

Vue.component('footer-site',{
  template: `
    <footer class="footer hero is-dark _footer-site">
      <div class="container">
        <div class="columns ">
          <div class="column _site" v-for="s in footer.sites">
            <div class="header">{{s.head}}</div>
            <span v-for="l in s.lists">
              <a :href="l.url">{{l.content}}</a>
            </span>
          </div>
          <div class="column _site">
            <div class="header">Contact us</div>
            <span v-for="c in footer.contacts">
              <a class="_icons" :href="c.url">
                <i class="fa" v-bind:class="[c.icon]"></i>
              </a>
            </span>
            <div class="header">Language</div>
            <span v-for="l in footer.languages">
              <a :href="l.url">{{l.native}}</a>
            </span>
          </div>
        </div>
      </div>
    </footer>
  `,
  props: ['footer']
});

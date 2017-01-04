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

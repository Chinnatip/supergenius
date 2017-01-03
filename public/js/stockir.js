Vue.component('marquee',{
  template: `
    <div class="_marquee_container">
      <p class="_marquee_text">
        Last Updated:
        <span class="set_last_updated">{{date}}</span> |
        Last done:
        <span class="set_last_done">{{last}}</span> |
        <span class="set_change">-</span> |
        <span class="set_change_percent">{{change}}</span> |
        Volume :
        <span class="set_volume">{{volumn}}</span> |
        High :
        <span class="set_high">{{high}}</span> |
        Low :
        <span class="set_low">{{low}}</span>
      </p>
    </div>
  `,
  props: ['date','last','change','volumn','high','low']
});

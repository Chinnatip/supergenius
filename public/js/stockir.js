Vue.component('marquee',{
  // sample
  // <marquee date="Jan 03, 2017 14:30" last="49.75" change="+0.00%" volumn="5,052,045.00" high="50.25" low="49.75"></marquee>
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

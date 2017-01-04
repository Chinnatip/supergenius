Vue.component('blogJumbo',{
  template: `
  <section class="is-medium _body_jumbo">
    <div class="hero-body container">
      <div class="__body">
        <h1>{{data.title}}</h1>
        <h2>{{data.desc}}</h2>
        <a :href="data.href" :class="data.linkclass">{{data.link}}</a>
      </div>
    </div>
  </section>
  `,
  props: ['data']
});

Vue.component('blogQuote',{
  template: `
    <section class="is-light is-medium _body_quote">
      <div class="hero-body container">
        <a class="_update">อัพเดทล่าสุด: {{stock.date}}</a>
        <div class="columns">
          <div class="column __header_quote">
            <h2>ราคาหลักทรัพย์</h2>
            <h1>{{stock.quote}}:SET</h1>
          </div>
          <div class="column">
            <h1>{{stock.price}} THB</h1>
            <h2>เปลี่ยนแปลง(%) -(%)</h2>
          </div>
          <div class="column">
            <h1>{{stock.volumn}}</h1>
            <h2>ปริมาณการซื้อขายหุ้น:</h2>
          </div>
          <div class="column">
            <h1>{{stock.low}} - {{stock.high}}</h1>
            <h2>ช่วงราคาระหว่างวัน:</h2>
          </div>
          <div class="column">
            <h1>{{stock.lowyear}} - {{stock.highyear}}</h1>
            <h2>ช่วงราคาใน 52สัปดาห์:</h2>
          </div>
        </div>
        <a class="_history" :href="stock.link">ราคาหลักทรัพย์</a>
      </div>
    </section>
  `,
  props: ['stock']
});

Vue.component('blogHeader',{
  template: `
  <section class="is-medium _body_header">
    <div class="hero-body container">
      <div class="__body">
        <h1>{{data}}</h1>
      </div>
    </div>
  </section>
  `,
  props: ['data']
});

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

Vue.component('tableRating',{
  template: `
  <section class="is-medium _body_table">
    <div class="right _content">
      เลือกปีที่ต้องการค้นหา
      <select class="select">
        <option value="" v-for="s in selector">{{s}}</option>
      </select>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th v-for="l in table.thead">{{l.title}}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="td in table.tbody">
          <td>{{td.content[0]}}</td>
          <td>{{td.content[1]}}</td>
          <td>{{td.content[2]}}</td>
          <td>{{td.content[3]}}</td>
          <td><a :href="td.content[4]" class="button is-primary is-outlined">ดาวโหลด</a></td>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <th v-for="l in table.tfoot">{{l.title}}</th>
        </tr>
      </tfoot>
    </table>
  </section>
  `,
  props: [ 'table' , 'selector']
});

Vue.component('tableBlog',{
  template: `
  <section class="is-medium _body_table">
    <div class="_content">
      ณ วันที่ 29 พฤศจิกายน 2559
    </div>
    <table class="table">
      <thead>
        <tr>
          <th v-for="l in table.thead">{{l.title}}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(td,index) in table.tbody">
          <td>{{index + 1}}</td>
          <td>{{td.content[0]}}</td>
          <td>{{td.content[1]}}</td>
          <td>{{td.content[2]}}</td>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <th v-for="l in table.tfoot">{{l.title}}</th>
        </tr>
      </tfoot>
    </table>
  </section>
  `,
  props: [ 'table' ]
});

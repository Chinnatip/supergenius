Vue.component('contentSimple',{
  template: `
    <div class="_simple_container">
      <div class="container">
        <div v-for="t in content">
          <p v-if="t.ex == 'text'">{{t.text}}</p>
          <ul v-if="t.ex == 'list'">
            <li v-for="l in t.set">{{l}}</li>
          </ul>
        </div>
      </div>
    </div>
  `,
  props: ['content']
});

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
        <a v-if="data.link > 0" :href="data.href" :class="data.linkclass">{{data.link}}</a>
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
    <div class="_content" v-if="table.hint.check">
      {{table.hint.text}}
    </div>
    <table class="table">
      <thead>
        <tr v-if="table.headtype == 'special'" v-for="set in table.thead">
          <th v-for="t in set.tr" :colspan="t.colspan" :rowspan="t.rowspan" >{{t.text}}</th>
        </tr>
        <tr v-if="table.headtype == ''">
          <th v-for="t in table.thead">{{t.title}}</th>
        </tr>
      </thead>
      <tbody>

        <!-- normal table ><-->
        <tr
          v-for="(td,index) in table.tbody"
          v-if=" table.bodytype == 'list'"
          v-bind:class="{ '_highlight': td.highlight }"
        >
          <td
            v-if="td.index"
            :colspan="td.colspan">
            <span v-if="td.index">
              <span v-if="!td.noindex">{{index + 1}}</span>
            </span>
          </td>
          <td v-for="c in td.text" :colspan="td.colspan">
            <div v-if="c.type == 'contact'">
              <span>โทรศัพท์: {{c.tel}} </span> <br>
              <span>Email:   {{c.email}} </span>
            </div>
            <div v-else >{{c}}</div>
          </td>
        </tr>

        <!-- download table ><-->
        <tr v-for="(td,index) in table.tbody" v-if=" table.bodytype == 'download'">
          <td>{{td.text[0]}}</td>
          <td><a class="button" :href="td.text[1]">ดาวโหลด</a></td>
        </tr>
      </tbody>
      <tfoot v-if="table.tfoot.length > 0">
        <tr>
          <th v-for="l in table.tfoot" :colspan="l.colspan" >{{l.title}}</th>
        </tr>
      </tfoot>
    </table>
  </section>
  `,
  props: [ 'table' ]
});


Vue.component('selectQuote',{
  template: `
  <div class="_simple_container">
    <div class="container">
      <div class="_select_date">
      <span class="header">เลือกช่วงวันที่</span> <br>
        <span class="hint">จาก</span>
        <select class="select">
          <option value="1" selected="selected">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
        <select class="select">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="12" selected="selected">12</option>
        </select>
        <select class="select">
          <option value="2559">2559</option>
          <option value="2560" selected="selected">2560</option>
        </select>
        <span class="hint">ถึง</span>
        <select class="select">
          <option value="1" selected="selected">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
        <select class="select">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="12" selected="selected">12</option>
        </select>
        <select class="select">
          <option value="2559">2559</option>
          <option value="2560" selected="selected">2560</option>
        </select>
        <a class="button" href="#">ดูผล</a>
      </div>
    </div>
  </div>
  `,
  props:['']
});

Vue.component('squareGrid',{
  template: `
  <div class="_simple_container">
    <div class="container">
      <a class="_news_cube" v-for="n in news" :href="n.url">
          <h1>{{n.head}}</h1>
          <h3>{{n.date}}</h3>
      </a>
    </div>
  </div>
  `,
  props:['news']
});

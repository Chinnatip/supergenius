Vue.component('contentSimple',{
  template: `
    <div class="_simple_container">
      <div class="container">
        <div v-for="t in content">
          <p v-if="t.ex == 'text'" style="max-width:540px;">{{t.text}}</p>
          <ul v-if="t.ex == 'list'">
            <li v-for="l in t.set">{{l}}</li>
          </ul>
          <div v-if="t.ex == 'column'" class="columns _text_column">
            <div class="column" v-for="p in t.text">{{p}}</div>
          </div>
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
      <div class="__body" :class="blogstyle">
        <h1>{{data.title}}</h1>
        <h2>{{data.desc}}</h2>
        <h4 v-for="d in data.text">{{d}}</h4>
        <a v-if="data.hasLink" :href="data.href" :class="data.linkclass">{{data.link}}</a>
      </div>
    </div>
  </section>
  `,
  props: ['data','blogstyle']
});

Vue.component('blog-quote-main',{
  template: `
    <section class="is-light is-medium _body_quote">
      <div class="hero-body container">
        <div class="column __header_quote">
          <h2>ราคาหลักทรัพย์</h2>
          <!-- h1>{{stock.quote}}:SET</h1 -->
          <h1>PCL:SET</h1>
        </div>
        <div class="columns">
          <div class="column"></div>
          <div class="column">
            <h1>{{stock.price}} THB</h1>
            <h2>
              เปลี่ยนแปลง(%)<br>
              <span class="text">{{stock.change}} ({{stock.cpercent}}%) </span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ปริมาณการซื้อขายหุ้น: <br>
              <span class="text">{{stock.volumn}}</span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ช่วงราคาระหว่างวัน: <br>
              <span class="text">{{stock.range}}</span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ช่วงราคาใน 52สัปดาห์: <br>
              <span class="text">{{stock.yearRange}}</span>
            </h2>
          </div>
        </div>
      </div>
    </section>
  `,
  props: ['stock']
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
            <h2>
              เปลี่ยนแปลง(%)<br>
              <span class="text">{{stock.change}} ({{stock.cpercent}}%) </span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ปริมาณการซื้อขายหุ้น: <br>
              <span class="text">{{stock.volumn}}</span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ช่วงราคาระหว่างวัน: <br>
              <span class="text">{{stock.range}}</span>
            </h2>
          </div>
          <div class="column">
            <h1></h1>
            <h2>
              ช่วงราคาใน 52สัปดาห์: <br>
              <span class="text">{{stock.yearRange}}</span>
            </h2>
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
    <div class="left" v-if="header">
      <h1>{{header}}</h1>
    </div>
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
          <td style="text-align: center">{{td.content[1]}}</td>
          <td style="text-align: center">{{td.content[2]}}</td>
          <td style="text-align: center">{{td.content[3]}}</td>
          <td style="text-align: center"><a :href="td.content[4]" class="button  _simple_button">ดาวโหลด</a></td>
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
  props: [ 'table' , 'selector','header']
});

Vue.component('tableHolder',{
  template: `
  <section class="is-medium _body_table">
    <div class="left" v-if="table.hint.check">
      <h1 v-if="header">{{header}}</h1> <br>
    </div>
    <div class="right _content">
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

      <!-- board list ><-->
      <tr v-for="(td,index) in content" v-if=" table.bodytype = 'boardList'">
        <td style="text-align:center">{{index + 1}}</td>
        <td style="text-align:left">{{td.name}}</td>
        <td style="text-align:right">{{ addComma(td.stock) }}</td>
        <td style="text-align:right">{{ calc(td.stock,total) }} %</td>
      </tr>
      <tr v-if=" table.bodytype = 'boardList' " class="_highlight" >
        <td></td>
        <td>รวม 10 อันดับเเรก</td>
        <td style="text-align:right">{{ addComma(total) }}</td>
        <td style="text-align:right">{{ calc(total,total) }} %</td>
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
  props: [ 'table' , 'content' , 'header' ],
  methods: {
    calc: function( val , total ){
      return  Math.round( val / total * 10000 ) / 100 ;
    },
    addComma: function(val){
      //return val.toString() ;
      return val.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }
  },
  computed: {
    total: function(){
      return this.content.reduce(function(prev, board){
        return prev + board.stock;
      },0);
    }
  },
});

Vue.component('tableAnalyst',{
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
        v-for="(td,index) in content"
        v-if=" table.bodytype == 'list'">
        <td
          v-if="td.index"
          :colspan="td.colspan">
          <span v-if="td.index">
            <span v-if="!td.noindex">{{index + 1}}</span>
          </span>
        </td>
        <td style="text-align:center">{{ index + 1 }}</td>
        <td>{{td.company}}</td>
        <td>{{td.name}}</td>
        <td>
          <div>
            <span>โทรศัพท์: {{td.tel}} </span> <br>
            <span>Email:   {{td.email}} </span>
          </div>
        </td>
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
  props: [ 'table' , 'content' ]
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
        <!-- download table ><-->
        <tr v-for="(td,index) in table.tbody" v-if=" table.bodytype == 'download'">
          <td>{{td.text[0]}}</td>
          <td style="text-align: center"><a class="button _simple_button" :href="td.text[1]">ดาวโหลด</a></td>
        </tr>
        <!-- normal table ><-->
        <tr v-for="(td,index) in table.tbody" v-if=" table.bodytype == 'list'">
          <td
            v-for="t in td.text"
            :colspan="td.colspan"
            :class=" td.class "
            :style="{ textAlign: td.style}"
          >{{t}}</td>
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
  props: [ 'table' ],

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
      <a class="_news_cube" v-for="n in news" :href="n.url" v-bind:class="[styler]">
          <h1>{{n.title}}</h1>
          <h3>{{n.created_at}}</h3>
      </a>
    </div>
  </div>
  `,
  props:['news','styler']
});

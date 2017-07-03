
Vue.component('footer-site',{
  template: `
    <footer class="footer hero is-dark _footer-site">
      <div class="container">
        <div class="columns ">
          <div class="column _site" v-for="s in footer.sites">
            <div class="header">{{s.head}}</div>
            <span v-for="l in s.lists">
              <a class="links" :href="l.url">{{l.content}}</a>
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

Vue.component('footer-site-corp',{
  template: `
    <footer class="footer hero is-dark _footer-site-corp">
      <div class="container">
        <div class="columns ">
          <div class="column">
            <p class="head-up ">Find Us on Facebook</p>
            <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fsupergeniusschool%2F&tabs=timeline&width=320&height=150px&small_header=true&adapt_container_width=false&hide_cover=false&show_facepile=true&appId=155981588273147" width="340" height="150px" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
          </div>
          <div class="column">
            <p class="head-up ">Recent News</p>
            <div v-for="(f,index) in feed">
              <a target="_blank" class="news-footer news" :href=" '/home/news_detail?id=' + f.id" v-if="index < 3">{{f.title}}</a>
            </div>
            <a target="_blank" class="news-footer" href="/home/news">อ่านข่าวทั้งหมด </a>
          </div>
          <div class="column">
            <p class="head-up content-right">Contact Info</p>
            <p class="content-right">
              รังสิต-ปทุมธานี 14 ซอย 9 ต. ประชาธิปัตย์ <br>
              อ.ธัญบุรี จ. ปทุมธานี 12130 <br>
              Map: <a target="_blank" href="https://www.google.co.th/maps/place/%E0%B8%81%E0%B8%A7%E0%B8%94%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2+Super+Genius/@13.9906129,100.6010133,17z/data=!3m1!4b1!4m5!3m4!1s0x30e281c4239839c3:0xc5a8d637c409ce6d!8m2!3d13.9906129!4d100.603202?hl=en" class="yellow">ดูแผนที่บน Google Map</a>  <br>
              Mobile: <a href="tel:0897606279" class="yellow">📱 089-760-6279(พี่วิน)</a>  <br>
              Email: <a href="mailto:windz_bs@hotmail.com" class="yellow">✉️ windz_bs@hotmail.com</a>
            </p>
          </div>
        </div>
        <div class="columns ">
          <div class="column">
            <p>ขอสงวนลิขสิทธิ์ © 2017 บริษัท Super Genius จำกัด</p>
          </div>
          <div class="column">
            <a class="_bread" href="">ข้อกำหนดและเงื่อนไข</a>
            <a href="">นโยบายความเป็นส่วนตัว</a>
          </div>
        </div>
      </div>
    </footer>
  `,
  props: ['footer'],
  data: function(){
    return {
      feed: []
    }
  },
  mounted: function() {
    var that = this;
    $.ajax({
      url: '/newsfeeds.json',
      success: function(res) {
        that.feed = res;
      }
    });
  }
});

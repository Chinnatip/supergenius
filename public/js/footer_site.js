
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
            <p>ติดต่อฝ่ายนักลงทุนสัมพันธ์</p>
            <p>คุณนิเวศน์ ทรัพย์ยืนยง โทรศัพท์ 02-999-9999 อีเมล์ niwet@pcl.co.th</p>
          </div>
          <div class="column">
            <p>สำนักงานฝ่ายนักลงทุนสัมพันธ์</p>
            <p>อาคารดับเบิลยู ชั้น 3 ถนนพระอาทิตย์ แขวงชนะสงคราม เขตพระนคร กรุงเทพมหานคร 10200</p>
          </div>
        </div>
        <div class="columns ">
          <div class="column">
            <p>ขอสงวนลิขสิทธิ์ © 2017 บริษัท มหาชน จำกัด</p>
          </div>
          <div class="column">
            <a href="">ข้อกำหนดและเงื่อนไข</a>
            <a href="">นโยบายความเป็นส่วนตัว</a>
          </div>
        </div>
      </div>
    </footer>
  `,
  props: ['footer']
});

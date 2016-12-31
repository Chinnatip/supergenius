var comp = new Vue({
  el: '#app',
  data: {
    body: {
      theme: 'is-info',
      size:  'is-large',
      title: 'Vue&Bulma sample with Rails stack',
      sub:   'Vuejs 2.1.6 | Bulma 0.2.3 | Rails 5.0.0'
    },
    nav: {
      brand: 'https://s29.postimg.org/5xtetqw6v/vbr.png',
      brandLink: '#',
      links: [
        {
          title: 'Document',
          link: '#'
        },{
          title: 'Example',
          link: '#'
        },{
          title: 'FAQS',
          link: '#'
        }
      ],
      backLink: {
        title: 'Craighub',
        icon: 'fa-arrows-alt',
        link: 'http://www.facebook.com/zinatip'
      }
    },
    testimo: {
      title: 'Are you OK with this ?',
      sub:   'just answer me at this time | then I will share your story'
    },
    masons: [
      {
          name: 'Chinnatip',
          address: 'chinnatip@me.com',
          desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.',
          date: '11:09 PM - 1 Jan 2016',
          profile: 'http://placehold.it/64x64',
          image: 'http://placehold.it/300x225'
      },{
          name: 'Tryn',
          address: 'Tryn@kohlife.com',
          desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.',
          date: '11:09 PM - 1 Jan 2016',
          profile: 'http://placehold.it/64x64',
          image: 'http://placehold.it/300x225'
      },{
          name: 'Pawit',
          address: 'Pawit@kohlife.com',
          desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.',
          date: '11:09 PM - 1 Jan 2016',
          profile: 'http://placehold.it/64x64',
          image: 'http://placehold.it/300x225'
      }
    ]
  }
});

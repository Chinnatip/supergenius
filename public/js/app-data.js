var comp = new Vue({
  el: '#app',
  data: {
    hell: 'moromoromoro',
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
    footer:{
      contacts:[
        {icon: 'fa-facebook-official' , url: '#'},
        {icon: 'fa-envelope' , url: '#'},
        {icon: 'fa-phone-square' , url: '#'}
      ],
      languages: [
        {native: 'THAI' , url: '#'},
        {native: 'ENGLISH' , url: '#'}
      ],
      sites: [
        {
          //first list
          head : 'First list',
          lists:[
            { content: 'click me', url: '#' },
            { content: 'click me', url: '#' },
            { content: 'click me', url: '#' }
          ]
        },{
          //second list
          head : 'Second list',
          lists:[
            { content: 'click me', url: '#' },
            { content: 'click me', url: '#' },
          ]
        },{
          //third list
          head : 'Last list',
          lists:[
            { content: 'click me', url: '#' },
          ]
        }
      ]
    },
    grid: {
      title: 'Show me some text',
      desc: 'see our reason that why we difference.',
      lists: [
          {head: 'Sample#1',detail: 'see more details',image: "/img_ref/web_ref.png"},
          {head: 'Sample#2',detail: 'see more details',image: "/img_ref/web_ref.png"},
          {head: 'Sample#3',detail: 'see more details',image: "/img_ref/web_ref.png"},
      ]
    },
    testimo: {
      title: 'Are you OK with this ?',
      sub:   'just answer me at this time | then I will share your story'
    },
    mason: {
      title: 'Show me some text',
      desc: 'see our reason that why we difference.',
      counts: 3 ,
      lists: [
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
        },{
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
        }      ]
    },
    maps: [
      { head: 'facebook' , icon: 'fa-facebook-official', url: 'http://www.facebook.com/zinatip', content: 'www.facebook.com/zinatip'},
      { head: 'email'    , icon: 'fa-envelope'         , url: 'mailto:chinnatip@me.com' , content: 'chinnatip@me.com'},
      { head: 'telephone', icon: 'fa-phone-square'     , url: 'tel:+66909847814' ,content: '090.984.7814'}
    ]

  }
});

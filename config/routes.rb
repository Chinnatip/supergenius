Rails.application.routes.draw do
  #home page
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  get 'home/portfolio'
  get 'home/comp'
  get 'home/reddit'
  get 'home/single'

  #investor page
  get 'investor/index'
  get 'investor/financial'
  get 'investor/share'
  get 'investor/bond'
  get 'investor/stock'
  get 'investor/news'
  get 'investor/contact'

  #pages
  get 'page/about'
  get 'page/news'
  get 'page/contact'

  root 'home#single'
  #root 'home#reddit'
  #root 'home#comp'
  #root 'home#playground'
  #root 'home#index'
end

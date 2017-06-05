Rails.application.routes.draw do


  resources :exams
  resources :schools
  resources :seats
  resources :classrooms
  resources :teachers
  resources :courses
  resources :students
  resources :quotations
  resources :products
  resources :analysts
  devise_for :users

  resources :newsfeeds
  resources :employees
  resources :boards

  #home page
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  get 'home/portfolio'
  get 'home/comp'
  get 'home/reddit'
  get 'home/single'
  get 'home/celebrity'

  #investor page
  get 'investor/index'
  get 'investor/financial'
  get 'investor/share'
  get 'investor/share_right'
  get 'investor/share_history'
  get 'investor/share_holder'
  get 'investor/bond'
  get 'investor/bond_policy'
  get 'investor/stock'
  get 'investor/stock_history'
  get 'investor/stock_cap'
  get 'investor/stock_concensus'
  get 'investor/stock_analyst'
  get 'investor/news'
  get 'investor/news_calendar'
  get 'investor/news_set'
  get 'investor/contact'
  get 'investor/contact_email'

  #pages
  get 'page/about'
  get 'page/news'
  get 'page/contact'

  #dashboard page
  get 'dashboard/index'
  get 'dashboard/new'
  get 'dashboard/product'
  get 'dashboard/board'

  #root 'home#celebrity'
  root 'page#about'
end

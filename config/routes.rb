Rails.application.routes.draw do

  resources :cms
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

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

  resources :newsfeeds
  resources :employees
  resources :boards
  resources :report
  resources :kid

  #classroom page
  get 'class_detail' => 'classrooms#class_detail', as: :classrooms_class_detail

  #kid page
  get 'feedback' => 'kid#feedback', as: :kid_feedback

  #home page
  get 'home/index'
  get 'home/introduce'
  get 'home/course'
  get 'home/news'
  get 'home/news_detail'
  get 'home/contact'
  get 'home/about'
  get 'home/student'
  get 'home/tutor'
  get 'home/top_student'
  get 'home/celebrity'
  get 'home/class_detail'
  get 'home/update_score'
  get 'home/update_course'
  get 'home/update_class'
  get 'home/edit_current'
  get 'help' => 'home#help' , as: :home_help

  #init json controllers
  get 'init/get_subscription'
  get 'init/get_class_advisee'

  #pages
  # get 'page/about'
  get 'page/news'
  get 'page/contact'

  #dashboard page
  get 'dashboard/index'
  get 'dashboard/new'
  get 'dashboard/product'
  get 'dashboard/board'

  root 'home#index'
end

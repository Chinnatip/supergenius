Rails.application.routes.draw do

  resources :comments
  resources :registers
  resources :addcourses
  resources :majors
  resources :semesters
  resources :configurs
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
  get 'home/update_addcourse'
  get 'home/update_course'
  get 'home/update_class'
  get 'home/edit_current'
  get 'home/remove_period'
  get 'home/add_table'
  get 'home/add_comment'
  get 'home/add_seat_comment'
  get 'help' => 'home#help' , as: :home_help
  get 'set_year' => 'home#set_year' , as: :home_set_year
  get 'set_semester' => 'home#set_semester' , as: :home_set_semester

  #init json controllers
  get 'init/get_subscription'
  get 'init/get_class_advisee'
  get 'init/get_addcourse_note'
  get 'init/get_comment_req'
  get 'init/get_seat_comment_req'

  #
  get 'video/index'

  #pages
  # get 'page/about'
  get 'page/news'
  get 'page/contact'

  #
  get 'student_report/:id' => 'report#student' , as: :report_student
  get 'check_student_trigger' => 'report#check_student_trigger' , as: :report_check_student_trigger

  #dashboard page
  get 'dashboard/index'
  get 'dashboard/new'
  get 'dashboard/product'
  get 'dashboard/board'
  get 'dashboard/current_course'

  # tasker
  get 'task/add_student'
  get 'task/add_student_trigger'
  get 'task/add_seat'
  get 'task/add_seat_trigger'
  get 'task/remove_student_from_course'
  get 'task/remove_student_from_class'

  root 'home#index'
end

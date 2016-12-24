Rails.application.routes.draw do
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  root 'home#playground'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

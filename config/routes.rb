Rails.application.routes.draw do
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  #root 'home#playground'
  root 'home#index'
end

Rails.application.routes.draw do
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  get 'home/portfolio'
  #root 'home#playground'
  root 'home#index'
end

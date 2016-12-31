Rails.application.routes.draw do
  get 'home/index'
  get 'home/test'
  get 'home/playground'
  get 'home/portfolio'
  get 'home/comp'
  get 'home/reddit'
  get 'home/single'

  root 'home#single'
  #root 'home#reddit'
  #root 'home#comp'
  #root 'home#playground'
  #root 'home#index'
end

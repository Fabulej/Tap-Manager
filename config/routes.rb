Rails.application.routes.draw do
  root to: "taps#index"
  get 'kegs/index'
  devise_for :users
  resources :beers
  resources :taps
end

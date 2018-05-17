Rails.application.routes.draw do
  resources :priorities
  root to: "taps#index"
  devise_for :users
  resources :kegs
  resources :beers
  resources :taps
end

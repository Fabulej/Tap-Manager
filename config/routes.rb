Rails.application.routes.draw do
  root to: "taps#index"
  devise_for :users
  resources :kegs, only: :index
  resources :beers
  resources :taps
end

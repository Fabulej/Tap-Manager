Rails.application.routes.draw do
  devise_for :users
  root to: "taps#index"
  resources :beers
  resources :taps
end

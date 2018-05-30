Rails.application.routes.draw do
  resources :priorities
  root to: "taps#index"
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => :username
  resources :kegs
  resources :beers
  resources :taps
end

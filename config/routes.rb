Rails.application.routes.draw do
  resources :priorities
  root to: "taps#index"
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => :my
  resources :kegs
  resources :beers
  resources :taps
end

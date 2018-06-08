Rails.application.routes.draw do
  root   'taps#index'
  resources :pubs
  resources :priorities
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => :my
  resources :users
  resources :kegs
  resources :beers
  resources :taps
end

Rails.application.routes.draw do

  get 'breweries/new'

  get 'breweries/create'

  get 'breweries/index'

  get 'breweries/destroy'

  root   'taps#index'
  resources :styles
  resources :breweries
  resources :pubs
  resources :priorities
  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => :my
  resources :users
  resources :kegs
  resources :beers
  resources :taps
end

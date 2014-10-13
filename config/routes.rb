Rails.application.routes.draw do

  get 'restaurants/search'

  resources :restaurants
  root 'home#index'
end

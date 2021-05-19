Rails.application.routes.draw do
  resources :newusers
  devise_for :users
  resources :items
  resources :subscribers

  # get 'home/homePage'
  root 'home#homePage'
  get 'home/men'
  get 'home/women'
  get 'home/kids'
  get 'home/newins'
  get 'home/saved'
  get 'home/help'
  get 'saveds/update'
  get 'home/update'
  get 'home/subscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

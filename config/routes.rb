Rails.application.routes.draw do
  

  get '/cart', to: "carts#show"
  resources :products 
  get "sign_up", to: "user_registration#new"
  post "sign_up", to: "user_registration#create"
  
  get "login", to: "user_login#new"
  post "login", to: "user_login#create"
  delete "logout", to: "user_login#destroy"
  
  get "/auth/twitter/callback", to: "user_login#omniauth"
  
  get "/men", to: "products#allNewIns"
  
  post "products/:id", to: "products#editList" 
  
  post "cart_items", to: "cart_items#create"

  post "cart_items/:id/add", to: "cart_items#add", as: "cart_item_add"
  post "cart_items/:id/reduce", to: "cart_items#reduce", as: "cart_item_reduce"
  delete "cart_items/:id", to: "cart_items#destroy", as: "cart_item_remove"
  
  root to: "main#index"
  
end

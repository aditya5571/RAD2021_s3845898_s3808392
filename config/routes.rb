Rails.application.routes.draw do
  

  resources :carts
  resources :products
  get "sign_up", to: "user_registration#new"
  post "sign_up", to: "user_registration#create"
  
  get "login", to: "user_login#new"
  post "login", to: "user_login#create"
  delete "logout", to: "user_login#destroy"
  
  get "/auth/twitter/callback", to: "user_login#omniauth"
  
  get "newsletter", to: "newsletter#subscribe"
  get "/newsletter/subscribe"
  
  
  
  root to: "main#index"
  
end

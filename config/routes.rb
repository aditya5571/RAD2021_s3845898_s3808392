Rails.application.routes.draw do
  

  get "sign_up", to: "user_registration#new"
  post "sign_up", to: "user_registration#create"
  
  get "login", to: "user_login#new"
  post "login", to: "user_login#create"
  delete "logout", to: "user_login#destroy"
  
  get "/auth/twitter/callback", to: "user_login#omniauth"
  
  root to: "main#index"
  
end

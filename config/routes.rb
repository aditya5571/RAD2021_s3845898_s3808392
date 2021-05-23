Rails.application.routes.draw do
  

  get '/cart', to: "carts#show"
  resources :products 
  post "/products/:id/save", to: "products#save", as:"product_save"
  post "/products/:id/unsave", to: "products#unsave", as:"product_unsave"
  
  get "/products/:id/setAvailableColours", to: "products#setAvailableColours"
  get "/products/:id/setAvailableQuantity", to: "products#setAvailableQuantity"

  
  get "sign_up", to: "user_registration#new"
  post "sign_up", to: "user_registration#create"
  
  get "login", to: "user_login#new"
  post "login", to: "user_login#create"
  delete "logout", to: "user_login#destroy"
  
  get "/auth/twitter/callback", to: "user_login#omniauth"
  
  get "/newins", to: "products#allNewIns"
  get "/men", to: "products#allMen"
  get "/women", to: "products#allWomen"
  get "/kids", to: "products#llKids"
  
  post "products/:id", to: "products#editList" 
  
  post "cart_items", to: "cart_items#create"

  post "cart_items/:id/add", to: "cart_items#add", as: "cart_item_add"
  post "cart_items/:id/reduce", to: "cart_items#reduce", as: "cart_item_reduce"
  delete "cart_items/:id", to: "cart_items#destroy", as: "cart_item_remove"
  
  get "/support", to: "application#showSupport"
  get "/savedItems", to: "products#allSavedItems"
  get "/account", to: "application#account"
  
  get "/newsletter/subscribe"
  
  root to: "main#index"
  
end

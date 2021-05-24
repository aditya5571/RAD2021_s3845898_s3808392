class MainController < ApplicationController
    def index
        if session[:current_user]
            @user = User.find_by(id: session[:current_user])
            
        end
        
        @products = Product.where("popularity > ?", 50)
    end
end

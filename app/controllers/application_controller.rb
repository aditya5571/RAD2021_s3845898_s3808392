class ApplicationController < ActionController::Base

     
     def account
         binding.pry
         @user = User.find_by(id: session[:current_user])
     end
end

class ApplicationController < ActionController::Base

     
     def account
         @user = User.find_by(id: session[:current_user])
     end
end

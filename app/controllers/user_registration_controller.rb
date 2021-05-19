class UserRegistrationController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user] = @user.id
            redirect_to root_path, notice:"Sign Up successful"
        else
        
            render :new
        end
    end
    private
    
    def user_params
        params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
    end
end

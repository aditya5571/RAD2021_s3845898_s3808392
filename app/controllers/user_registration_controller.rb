class UserRegistrationController < ApplicationController
    def new
        if session[:current_user]
            redirect_to account_path
        else
            @user = User.new
        end
    end
    def create
        if User.find_by(email: params[:user][:email]).present?
            redirect_to login_path, notice:"User with this email already exists. Please log in."
        else
            @user = User.new(user_params)
            if @user.save
                session[:current_user] = @user.id
                Cart.create({user_id: @user.id})
                redirect_to root_path, notice:"Sign Up successful"
            else
            
                render :new
            end
        end
    end
    private
    
    def user_params
        params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
    end
end

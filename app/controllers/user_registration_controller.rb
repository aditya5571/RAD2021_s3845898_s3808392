class UserRegistrationController < ApplicationController
    def new
        @user = User.new
    end
    def create
        binding.pry
        if User.find_by(email: params[:user][:email]).present?
            redirect_to login_path, notice:"User with this email already exists. Please log in."
        else
            @user = User.new(user_params)
            binding.pry
            if @user.save
                session[:current_user] = @user.id
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

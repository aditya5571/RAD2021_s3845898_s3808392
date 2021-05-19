class UserLoginController < ApplicationController

def new
end

def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
        session[:current_user] = user.id
        redirect_to root_path, notice: "Logged in successful"
    else
        flash[:alert] = "Invalid username or password"
        render :new
    end
end

def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: "Logged out"
end

def omniauth
    password = SecureRandom.hex(15)
    user = User.find_or_create_by(uid: auth.uid, provider: auth.provider) do |u|
       u.firstName =  request.env['omniauth.auth'].info.name.split(" ")[0]
        if(request.env['omniauth.auth'].info.name.split(" ")[1] != nil)
           u.lastName = request.env['omniauth.auth'].info.name.split(" ")[1]
        end
        if(request.env['omniauth.auth'].info.email != nil)
           u.email = request.env['omniauth.auth'].info.email
        end
        u.password = SecureRandom.hex(15)
    end
    
    binding.pry
    session[:current_user] = user.id
    redirect_to root_path, notice: "Logged in successful"
    
end

def auth
    request.env['omniauth.auth']
end




end
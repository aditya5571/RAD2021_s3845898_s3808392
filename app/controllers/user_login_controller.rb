class UserLoginController < ApplicationController


def new
    if session[:current_user]
            redirect_to account_path
    end
    session[:referrer] = request.referrer

end

def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
        session[:current_user] = user.id
        if session[:previous_path] == "/cart_items"
            product = Product.find_by(id: session[:previous_params]["product_id"])
            @cart_item = CartItem.new
            @cart_item.cart = Cart.find_by(user_id: user.id)
            @cart_item.product = product
            @cart_item.size_id = session[:previous_params]["size_id"]
            @cart_item.colour_id = session[:previous_params]["colour_id"]
            @cart_item.quantity = session[:previous_params]["quantity"]
            @cart_item.save
            product.increasePopularity
            redirect_to "/cart"
        else
            redirect_to root_path, notice: "Log in successful"
        end
    else
        flash[:alert] = "Invalid username or password."
        redirect_to login_path
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
        u.password = password
        u.password_confirmation = password
    end
    
    session[:current_user] = user.id
    redirect_to root_path, notice: "Logged in successful"
    
end

def auth
    request.env['omniauth.auth']
end




end
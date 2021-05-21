class CartsController < ApplicationController
  def show
      @cart = Cart.find_by(user_id: session[:current_user])
  end
  
  
end

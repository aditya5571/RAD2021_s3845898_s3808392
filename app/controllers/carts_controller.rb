class CartsController < ApplicationController
  def show
      set_cart
  end
  
  def checkOut
    set_cart
    @cart.cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to "/cart"
  end
  
  def set_cart
    @cart = Cart.find_by(user_id: session[:current_user])
  end
end

class CartItemsController < ApplicationController
    
    def create
        selected_product = Product.find_by(id: params[:product_id])
        current_cart = Cart.find_by(user_id: session[:current_user])
        
        if current_cart.products.include?(selected_product)
            redirect_to "products/"+params[:product_id]
        else
            @cart_item = CartItem.new
            @cart_item.cart = current_cart
            @cart_item.product = selected_product
            @cart_item.size_id = params[:size]
            @cart_item.colour_id = params[:colour]

            @cart_item.quantity = params[:quantity]
            @cart_item.save
            redirect_to "/cart"
        end
    
end

def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to "/cart"
end

def add
  @cart_item = CartItem.find(params[:id])
  @cart_item.quantity += 1
  @cart_item.save
  redirect_to "/cart"
end

def reduce
  @cart_item = CartItem.find(params[:id])
  if @cart_item.quantity > 1
    @cart_item.quantity -= 1
  end
  @cart_item.save
  redirect_to "/cart"
  end
  end

class ShoppingCartsController < ApplicationController
  def show
    @cart = @current_shopping_cart
  end

  def destroy
    @cart = @current_shopping_cart
    @cart.destroy
    session[:shopping_cart_id] = nil
    redirect_to root_path
  end
end

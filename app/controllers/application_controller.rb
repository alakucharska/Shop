class ApplicationController < ActionController::Base
  before_action :current_shopping_cart

  private

  def current_shopping_cart
    if session[:shopping_cart_id]
      @current_shopping_cart = Cart.find(session[:shopping_cart_id])
    else
      @current_shopping_cart = Cart.create
      session[:shopping_cart_id] = @current_shopping_cart.id
    end
  end
end

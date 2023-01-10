class ApplicationController < ActionController::Base
  before_action :current_shopping_cart, :current_customer

  private

  def current_customer
    if session[:user_id]
      @customer = User.find(session[:user_id])
    end
  end

  def current_shopping_cart
    if login?
      @current_shopping_cart = @customer.shopping_cart
    elsif session[:shopping_cart_id]
      @current_shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    else
      @current_shopping_cart = ShoppingCart.create
      session[:shopping_cart_id] = @current_shopping_cart.id
    end
  end

  def login?
    current_customer
  end
end

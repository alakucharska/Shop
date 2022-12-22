# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
      flash.now[:success] = "New product has been created!"
    else
      render :new, status: :unprocessable_entity
      flash.now[:danger] = "Error. Please provide all necessary information to create a new product"
    end
  end
end

# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.sort_by_name
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
      flash[:success] = "New product has been created!"
    else
      render :new, status: :unprocessable_entity
      flash[:danger] = "Error. Please provide all necessary information to create a new product"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "The Product has been updated!"
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
      flash[:danger] = "Something went wrong. Product's information has not been updated "
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
    flash[:success] = "Product has been deleted"
  end

  private

  def product_params
<<<<<<< HEAD
    params.require(:product).permit(:name, :category, :price, :description, :image)
=======
    params.require(:product).permit(:name, :category, :price, :description, :pic)
>>>>>>> 5b058f3e07b68e3149986022a9b1a33de4d4c9b8
  end
end

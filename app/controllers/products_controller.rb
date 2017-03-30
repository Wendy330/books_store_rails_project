class ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = Product.order("name").page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def display_by_categories
    @products_by_categories = Product.where("category_id = '1'")
  end
end

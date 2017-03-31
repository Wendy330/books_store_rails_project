class ProductsController < ApplicationController
  def index
    @products = Product.order("name").page(params[:page]).per(5)
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    else
      @products = Product.all.order("created_at DESC").page(params[:page]).per(5)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  # def display_by_categories
  #   @products_by_categories = Product.where("category_id = '1'")
  # end
end

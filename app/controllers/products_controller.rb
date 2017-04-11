class ProductsController < ApplicationController
  before_action :initialize_session

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

  def by_category
    @products = Product.includes(:category).where(:category_id => params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    session[:shopping_cart_list] << id unless session[:shopping_cart_list].include?(id)
    redirect_back(fallback_location: root_path)
  end

  def mark_as_added

  end

  private
  def initialize_session
    session[:shopping_cart_list] ||= []
  end


end

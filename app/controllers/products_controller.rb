class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_add_to_cart

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
    redirect_to added_to_shopping_cart_path
  end

  def added_to_shopping_cart
  end

  def proceed_to_checkout
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart_list].delete(id)

    redirect_to added_to_shopping_cart_path
  end

  private
  def initialize_session
    session[:shopping_cart_list] ||= []
  end

  def load_add_to_cart
    @shopping_cart_list = Product.find(session[:shopping_cart_list])
  end

end

class ProductsController < ApplicationController
  before_action :initialize_session
  # before_action :load_add_to_cart

  def index
    @products = Product.order("name").page(params[:page]).per(6)
    @line_item = current_order.line_items.new
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(6)
    else
      @products = Product.all.order("created_at DESC").page(params[:page]).per(6)
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
    product = Product.find(id)
    price = product.price
    session[:shopping_cart_list] << id unless session[:shopping_cart_list].include?(id)
    @order = current_order
    @line_item = @order.line_items.new(quantity: 1, product_id: id, price: price, total: price)
    @order.order_status_id = 3
    @order.save
    session[:order_id] = @order.id

    redirect_back(fallback_location: root_path)
  end

  def update_quantity
    id = params[:id].to_i
    @order = current_order
    @line_item = @order.line_items.find(params[:id])
    quantity = params[:s][:quantity].to_i
    price = params[:s][:price].to_f
    total = quantity * price
    @line_item.update_columns(quantity: quantity, price: price, total: total)
    @line_items = @order.line_items

    redirect_to added_to_shopping_cart_path
  end

  def added_to_shopping_cart
  end

  def proceed_to_checkout
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart_list].delete(id)

    @order = current_order
    @line_item = @order.line_items.where('product_id =?', params[:id]).first
    @line_item.destroy
    @line_items = @order.line_items
    if @line_items.count == 0
      @order.destroy
      session[:order_id] = nil
    end

    redirect_to added_to_shopping_cart_path
  end

  def shopping_cart_list
    @line_items = current_order.line_items
  end

  private
  def initialize_session
    session[:shopping_cart_list] ||= []
  end

  def load_add_to_cart
    # @shopping_cart_list = Product.find(session[:shopping_cart_list])
  end
  helper_method :shopping_cart_list
end

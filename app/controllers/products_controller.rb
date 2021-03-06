class ProductsController < ApplicationController
  before_action :initialize_session
  include SessionsHelper

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
    @order.order_status_id = 2
    if logged_in?
      @order.customer_id = current_customer.id
    end
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
    total = (quantity * price).to_f
    @line_item.update_columns(quantity: quantity, price: price, total: total)
    @line_items = @order.line_items

    redirect_to added_to_shopping_cart_path
  end

  def added_to_shopping_cart
  end

  def checkout
    @order = current_order
    @line_items = @order.line_items
    subtotal = 0
    @line_items.each do |item|
      subtotal += item.total
    end
    if logged_in?
      @order.customer_id = current_customer.id
    end
    @order.order_status_id = 3
    @order.subtotal = subtotal.round(2)
    @order.gst = 0
    @order.pst = 0
    @order.hst = 0
    @order.save
  end

  def order_confirmation
  end

  def calculate_total
    @order = current_order
    customer = Customer.find(@order.customer_id)
    province_id = customer.province_id.to_i
    province = Province.find(province_id)
    gst =  province.gst
    pst =  province.pst
    hst =  province.hst
    order_gst = @order.subtotal * gst
    order_pst = @order.subtotal * pst
    order_hst = @order.subtotal * hst
    @order.gst = order_gst.round(2)
    @order.pst = order_pst.round(2)
    @order.hst = order_hst.round(2)
    @order.total =  @order.gst  +  @order.pst + @order.hst + @order.subtotal
    @order.save

    redirect_to order_confirmation_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart_list].delete(id)

    @order = current_order
    @line_item = @order.line_items.where('product_id =?', params[:id]).first
    @line_item.destroy
    @line_items = @order.line_items

    if @line_items.count == 0
      @order.order_status_id = 4
      @order.gst = 0
      @order.pst = 0
      @order.hst = 0
      @order.total = 0
      @order.save
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

  helper_method :shopping_cart_list
end

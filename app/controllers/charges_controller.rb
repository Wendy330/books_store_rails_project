class ChargesController < ApplicationController

  Stripe.api_key = ENV['SECRET_KEY']

  def new
  end

  def create
    @order = current_order
    @order.order_status_id = 1
    @order.save

    amount = (@order.total * 100).to_i

    @customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => @customer.id,
      :amount      => amount,
      :description => 'Payment',
      :currency    => 'cad'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end

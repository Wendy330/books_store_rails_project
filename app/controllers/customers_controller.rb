class CustomersController < ApplicationController
  include SessionsHelper

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(user_params)
    if @customer.save
      # Handle a successful save.
      flash[:notice] = "Successfully created a customer account"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(user_params)
      # Handle a successful update.
      flash[:updated] = "Account information updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:customer).permit(:username, :email, :password, :first_name, :last_name, :phone, :address, :province_id)
    end
end

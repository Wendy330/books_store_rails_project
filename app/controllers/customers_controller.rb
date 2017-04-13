class CustomersController < ApplicationController
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

  private
    def user_params
      params.require(:customer).permit(:username, :email, :password, :first_name, :last_name, :phone, :address, :province_id)
    end
end

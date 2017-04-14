class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && Customer.find_by(password:params[:session][:password].downcase)
      # Log the user in and redirect to the home page.
      session[:customer_id] = customer.id
      redirect_to root_path
    else
      # Create an error message
      flash[:loginFail] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:customer_id)
    @current_customer = nil
    redirect_to root_path
  end
end

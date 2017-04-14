class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && Customer.find_by(password:params[:session][:password].downcase)
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end

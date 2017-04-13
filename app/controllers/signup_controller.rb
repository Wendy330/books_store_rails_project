class SignupController < ApplicationController
  def new
    @customer = Customer.new
  end

  def sign_up_success
    redirect_back(fallback_location: root_path)
  end
end

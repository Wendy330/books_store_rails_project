class SignupController < ApplicationController
  def sign_up
  end

  def new
    @customer = Customer.new
  end
end

module SessionsHelper
  # Logs in the given user.
  # def log_in(customer)
  #   session[:customer_id] = customer.id
  # end

  # Returns the current logged-in user (if any).
  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_customer.nil?
  end
end

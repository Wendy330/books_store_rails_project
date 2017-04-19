class AddCustomerStripeIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_stripe_id, :string
  end
end

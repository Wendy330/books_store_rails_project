class AddGstToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :gst, :decimal
  end
end

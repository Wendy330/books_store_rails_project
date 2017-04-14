class AddHstToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :hst, :decimal
  end
end

class AddPstToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pst, :decimal
  end
end

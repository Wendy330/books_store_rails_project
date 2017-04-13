class AddPasswordToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :password, :string
  end
end

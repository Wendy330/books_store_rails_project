class AddProvinceRefToCustomers < ActiveRecord::Migration[5.0]
  def change
    # add_reference :customers, :province, foreign_key: true
    add_column :customers, :province_id, :integer
    add_foreign_key :customers, :provinces
  end
end

class RemoveTaxRatesFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :tax_rates, :decimal
  end
end

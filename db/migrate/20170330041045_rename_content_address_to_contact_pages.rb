class RenameContentAddressToContactPages < ActiveRecord::Migration[5.0]
  def change
    rename_column :contact_pages, :contentAddress, :contents
  end
end

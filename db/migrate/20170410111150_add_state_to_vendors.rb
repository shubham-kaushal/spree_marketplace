class AddStateToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :state, :string
    add_index :spree_vendors, :state
  end
end

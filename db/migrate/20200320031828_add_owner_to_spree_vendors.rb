class AddOwnerToSpreeVendors < ActiveRecord::Migration[5.2]
  def change
    add_reference :spree_vendors, :owner
		add_foreign_key :spree_vendors, :spree_users, column: :owner_id 
  end
end
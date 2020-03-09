class AddContactUsToSpreeVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :contact_us, :text
  end
end

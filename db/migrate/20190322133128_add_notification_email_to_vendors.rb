class AddNotificationEmailToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :use_sku, :boolean, default: true
  end
end

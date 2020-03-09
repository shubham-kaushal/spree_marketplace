class AddNotificationEmailToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :notification_email, :string
  end
end

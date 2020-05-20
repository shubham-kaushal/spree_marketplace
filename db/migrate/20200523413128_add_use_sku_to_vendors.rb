class AddUseSkuToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :use_sku, :boolean, default: false
  end
end

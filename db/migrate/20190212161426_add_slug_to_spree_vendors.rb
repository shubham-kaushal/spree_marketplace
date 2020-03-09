class AddSlugToSpreeVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :slug, :string
    add_index :spree_vendors, :slug, unique: true
  end
end

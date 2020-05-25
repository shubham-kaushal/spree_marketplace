module Spree::ShipmentDecorator
  def self.prepended(base)
    base.scope :for_vendor, ->(vendor) { includes(stock_location: :vendor).where('spree_stock_locations.vendor_id' => vendor.id) }
    base.scope :not_for_vendor, ->(vendor) { includes(stock_location: :vendor).where.not('spree_stock_locations.vendor_id' => vendor.id) }
    base.scope :for_multi_vendor, ->(user) { includes(:stock_location).where('spree_stock_locations.vendor_id' => user.vendors.ids) }
  end
end

Spree::Shipment.prepend Spree::ShipmentDecorator

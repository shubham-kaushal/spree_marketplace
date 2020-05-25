module Spree
  class OrderCommission < Base
    belongs_to :order, required: Spree.version.to_f >= 3.5
    belongs_to :vendor, required: Spree.version.to_f >= 3.5

    validates :order, :vendor, presence: true
    validates :vendor_id, uniqueness: { scope: :order_id }

    scope :for_vendor, ->(vendor) { where(vendor_id: vendor.id) }
    scope :for_multi_vendor, ->(user) { where(vendor_id: user.vendors.ids) }
  end
end

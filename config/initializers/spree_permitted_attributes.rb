module Spree
  module PermittedAttributes
    ATTRIBUTES << :vendor_attributes

    mattr_reader *ATTRIBUTES

    @@vendor_attributes = [:name, :owner_id, :about_us, :contact_us, :notification_email]
    @@vendor_attributes << :image if Spree.version.to_f >= 3.6
  end
end
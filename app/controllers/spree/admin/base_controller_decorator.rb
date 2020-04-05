module Spree::Admin::BaseControllerDecorator
  Spree::Admin::BaseController.include(Spree::Admin::VendorHelper)

  def self.prepended(base)
    base.helper_method :current_spree_vendor
    base.helper_method :vendors_size
  end
end

Spree::Admin::BaseController.prepend Spree::Admin::BaseControllerDecorator

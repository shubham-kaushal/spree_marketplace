module Spree::Admin::BaseControllerDecorator
  Spree::Admin::BaseController.include(Spree::Admin::VendorHelper)
  Spree::Admin::BaseController.include(Spree::Admin::MultivendorHelper)  
  Spree::Admin::BaseController.include(Spree::Admin::SkusHelper)


  def self.prepended(base)
    base.helper_method :current_spree_vendor
    base.helper_method :multi_vendor
    base.helper_method :vendors_sku
  end
end

Spree::Admin::BaseController.prepend Spree::Admin::BaseControllerDecorator

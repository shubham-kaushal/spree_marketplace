require 'spree_core'
require 'spree_marketplace/engine'

module SpreeMarketplace
  # TODO: this should be moved into preferences
  def self.vendorized_models
    [
      Spree::OptionType,
      Spree::Product,
      Spree::Variant,
      Spree::Property,
      Spree::ShippingMethod,
      Spree::StockLocation
    ]
  end
end

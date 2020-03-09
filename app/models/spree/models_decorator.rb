module Spree::ModelsDecorator
  SpreeMarketplace.vendorized_models.each do |model|
    model.include Spree::VendorConcern
  end
end

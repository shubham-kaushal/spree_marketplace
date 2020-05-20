module Spree
  module Admin
    module SkusHelper

      def vendors_sku
				if current_spree_user.vendors
					current_spree_user.vendors.each do |vendor|
						return true if vendor.use_sku
					end
				false
				end
			end

    end
  end
end
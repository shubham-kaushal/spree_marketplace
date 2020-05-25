module Spree
  module Admin
    module MultivendorHelper

      def multi_vendor
				if current_spree_user.vendors && current_spree_user.vendors.size > 1
					return true
				end
				false
			end

    end
  end
end
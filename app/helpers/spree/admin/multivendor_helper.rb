module Spree
  module Admin
    module MultivendorHelper

      def multi_vendors
				if current_spree_user.vendors && current_spree_user.vendors.size > 1
					true
				else
					false
				end
			end

    end
  end
end
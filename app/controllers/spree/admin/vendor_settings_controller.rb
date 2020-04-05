module Spree
  module Admin
    class VendorSettingsController < Spree::Admin::BaseController
      before_action :authorize
      before_action :load_vendor, except: [:index, :commission]

      def index
        @vendors = current_spree_user.vendors
      end

      def update
        if vendor_params[:image] && Spree.version.to_f >= 3.6
          @vendor.create_image(attachment: vendor_params[:image])
        end
        if @vendor.update(vendor_params.except(:image))
          user = Spree::User.find_by_email(vendor_params[:email]) if vendor_params[:email]
          Spree::VendorUser.create(user: user, vendor: @vendor) if user
          redirect_to admin_vendor_settings_path
        else
          render :edit
        end
      end

      def commission
        if params[:vendor]
          vendor = Spree::Vendor.find_by_id(params[:vendor])
          commission = vendor.commission_rate
          render json: { commission: commission }          
        end
      end

      private

      def authorize
        authorize! :manage, :vendor_settings
      end

      def load_vendor
        if params[:id]
          @vendor = Spree::Vendor.find_by_id(params[:id])
        else
#          @vendor = current_spree_vendor
        end
        raise ActiveRecord::RecordNotFound unless @vendor
      end

      def vendor_params
        params.require(:vendor).permit(Spree::PermittedAttributes.vendor_attributes)
      end
    end
  end
end

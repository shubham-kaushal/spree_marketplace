module Spree::Admin::ProductsControllerDecorator
  def self.prepended(base)
#    base.before_action :set_vendor_id, only: [:create, :update]    
    base.before_action :load_vendors, only: [:new, :edit]
  end

  def new
    @product.vendor = @vendors.first
    super
  end

  def stock
    @variants = @product.variants.includes(*variant_stock_includes)
    @variants = [@product.master] if @variants.empty?
    @stock_locations = Spree::StockLocation.accessible_by(current_ability, :read).where(vendor_id: @product.vendor_id)
    if @stock_locations.empty?
      flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
      redirect_to admin_stock_locations_path
    end
  end

  private

  def load_vendors
    if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin)
      @vendors = Spree::Vendor.order(Arel.sql('LOWER(name)'))
    elsif current_spree_user.vendors
      @vendors = current_spree_user.vendors
    end
  end

end

Spree::Admin::ProductsController.prepend Spree::Admin::ProductsControllerDecorator

Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  name: 'add_hidden_field_for_vendor_commission',
  insert_after: 'div[data-hook="cost_price"]',
  text: <<-HTML
          <div id="vendor-commission" style="display: none;">
            <%= @product.vendor.commission_rate if @product.vendor %>
          </div>
        HTML
)
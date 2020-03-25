Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  name: 'show_variant_commission',
  insert_after: 'div[data-hook="price"]',
  text: <<-HTML
          <% if @product.vendor %>
            <div data-hook="admin_vendor_commission" class="card bg-light mb-3">
              <div class="card-body">
                <%= Spree.t(:commission) + ": " + @product.vendor.commission_rate.to_s + " %" %>                
                <div id="vendor-commission" style="display: none;">
                  <%= @product.vendor.commission_rate %>
                </div>
              </div>
            </div>
          <% end %>
        HTML
)
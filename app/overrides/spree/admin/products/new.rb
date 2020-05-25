Deface::Override.new(
    virtual_path: 'spree/admin/products/new',
    name: 'new_product_with_vendor_commission',
    insert_after: 'div[data-hook="new_product_price"]',
    text: <<-HTML
            <div data-hook="new_product_cost_price" class="col-12 col-md-4">
              <%= f.field_container :cost_price, class: ['form-group'] do %>
                <%= f.label :cost_price, Spree.t(:cost_price) %>
                <%= f.text_field :cost_price,
                                  value: number_to_currency(@product.cost_price, unit: ''),
                                  class: 'form-control' %>
                <%= f.error_message_on :cost_price %>
              <% end %>
            </div>
            <div id="vendor-commission" style="display: none;">
              <%= @product.vendor.commission_rate if @product.vendor %>
            </div>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/new',
    name: 'new_product_with_vendor',
    insert_before: 'div[data-hook="new_product_price"]',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) || multi_vendor %>
              <div data-hook="new_product_vendor" class="col-12 col-md-4">
                <%= f.field_container :vendor, class: ['form-group'] do %>
                  <%= f.label :vendor_id, Spree.t(:vendor) %> <span class="required">*</span>
                  <%= f.collection_select(:vendor_id, @vendors, :id, :name, { }, {class: 'select2'}) %>
                  <%= f.error_message_on :vendor_id %>                
                <% end %>
              </div>
            <% end %>
    HTML
)
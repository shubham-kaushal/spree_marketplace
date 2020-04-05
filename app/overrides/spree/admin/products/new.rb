Deface::Override.new(
    virtual_path: 'spree/admin/products/new',
    name: 'enable_create_product_with_vendor_commission',
    insert_after: 'div[data-hook="new_product_price"]',
    text: <<-HTML
            <div data-hook="new_product_cost_price" class="col-12 col-md-4">
              <%= f.field_container :cost_price, class: ['form-group'] do %>
                <%= f.label :cost_price, Spree.t(:cost_price) %> <span class="required">*</span>
                <%= f.text_field :cost_price,
                                  value: number_to_currency(@product.cost_price, unit: ''),
                                  class: 'form-control',
                                  required: true,
                                  oninvalid: "this.setCustomValidity('Completa este campo')",
                                  oninput: "setCustomValidity('')" %>
                <%= f.error_message_on :cost_price %>
              <% end %>
            </div>
            <div id="vendor-commission" style="display: none;"><%= @product.vendor.commission_rate %></div>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/new',
    name: 'enable_create_product_with_assigned_vendor',
    insert_after: 'div[data-hook="new_product_price"]',
    text: <<-HTML
            <% if @vendors.size > 1 %>
              <div data-hook="new_product_vendor" class="col-12 col-md-4">
                <%= f.field_container :vendor, class: ['form-group'] do %>
                  <%= f.label :vendor_id, Spree.t(:vendor) %> <span class="required">*</span>
                  <%= f.collection_select(:vendor_id, @vendors, :id, :name, { }, {class: 'select2'}) %>
                <% end %>
              </div>
            <% end %>
    HTML
)
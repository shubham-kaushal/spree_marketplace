Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'remove_product_price_required_span',
    replace: "erb[loud]:contains('f.label :price')",
    text: "<%= f.label :price, Spree.t(:master_price) %>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'make_product_price_readonly',
    replace: "erb[loud]:contains('f.text_field :price')",
    text: "<%= f.text_field :price, value: number_to_currency(@product.price, unit: ''), class: 'form-control', readonly: true %>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'add_product_cost_price_required_span',
    replace: "erb[loud]:contains('f.label :cost_price')",
    text: "<%= f.label :cost_price, raw(Spree.t(:cost_price) + required_span_tag) %>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'make_product_cost_price_required',
    replace: "erb[loud]:contains('f.text_field :cost_price')",
    text: "<%= f.text_field :cost_price, 
                             value: number_to_currency(@product.cost_price, unit: ''),
                             class: 'form-control',
                             required: true,
                             oninvalid: \"this.setCustomValidity('Completa este campo')\",
                             oninput: \"setCustomValidity('')\" %>
          <div id='vendor-commission' style='display: none;'><%= @product.vendor.commission_rate %></div>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'enable_product_vendor_management',
    insert_after: 'div[data-hook="admin_product_form_price"]',
    text: <<-HTML
            <% if @vendors %>
              <div data-hook="admin_product_form_vendor">
                <%= f.field_container :vendor, class: ['form-group'] do %>
                  <%= f.label :vendor_id, raw(Spree.t(:vendor) + required_span_tag) %>
                  <%= f.collection_select(:vendor_id, @vendors, :id, :name, { }, {class: 'select2'}) %>
                <% end %>
              </div>
            <% end %>
          HTML
)
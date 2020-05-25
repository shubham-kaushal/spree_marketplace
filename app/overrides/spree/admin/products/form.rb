Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'enable_vendors_to_manage_product_master_price',
  replace: 'div[data-hook="admin_product_form_price"]',
  text: <<-HTML
          <div data-hook="admin_product_form_price">
            <%= f.field_container :price, class: ['form-group'] do %>
              <%= f.label :price, raw(Spree.t(:master_price) + content_tag(:span, ' *', class: "required")) %>
              <%= f.text_field :price, value: number_to_currency(@product.price, unit: ''), class: 'form-control', disabled: (cannot? :update, Spree::Price) %>
              <%= f.error_message_on :price %>
            <% end %>
          </div>            
        HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'enable_product_vendor_management',
    insert_top: 'div[data-hook="admin_product_form_right"]',
    text: <<-HTML
            <% if multi_vendor %>
              <div data-hook="admin_product_form_vendor">
                <%= f.field_container :vendor, class: ['form-group'] do %>
                  <%= f.label :vendor_id, raw(Spree.t(:vendor) + required_span_tag) %>
                  <%= f.collection_select(:vendor_id, @vendors, :id, :name, { }, {class: 'select2'}) %>
                <% end %>
              </div>
            <% end %>
          HTML
)
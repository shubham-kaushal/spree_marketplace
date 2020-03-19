Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'Show vendor commission',
  insert_after: 'div[data-hook="admin_product_form_price"]',
  text: <<-HTML
          <% if @product.vendor %>
            <div data-hook="admin_vendor_commission" class="card bg-light mb-3">
              <div class="card-body">
                <%= Spree.t(:commission) + ": " + @product.vendor.commission_rate.to_s + " %" %>
              </div>
            </div>
          <% end %>
        HTML
)


Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'Enable admin to menage product vendor',
    insert_before: 'div[data-hook="admin_product_form_taxons"]',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
              <div data-hook="admin_product_form_vendor">
                <%= f.field_container :vendor, class: ['form-group'] do %>
                  <%= f.label :vendor_id, raw(Spree.t(:vendor) + required_span_tag) %>
                  <%= f.collection_select(:vendor_id, @vendors, :id, :name, { prompt: "" }, { class: 'select2' }) %>
                  <%= f.error_message_on :vendor %>
                <% end %>
              </div>
            <% end %>
          HTML
)

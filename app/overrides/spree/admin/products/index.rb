Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'products_vendor_search',
    insert_after: 'div[data-hook="admin_products_index_search"]>div:nth-of-type(2)',
    text: <<-HTML
        <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
          <div class="col-12 col-lg-6">
            <div class="form-group">
              <%= f.label :vendor_name_cont, Spree.t(:vendor_name) %>
              <%= f.text_field :vendor_name_cont, class: "form-control" %>
            </div>
          </div>
        <% end %>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'products_index_vendor_header',
    insert_before: 'tr[data-hook="admin_products_index_headers"] th.actions',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) || multi_vendors %>
                <th class="text-center">
                    <%= sort_link @search, :vendor_name, Spree.t(:vendor_name) %>
                </th>
            <% end %>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'product_vendor',
    insert_before: 'tbody td.actions',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) || multi_vendors %>
              <td class="vendor_name"><%= product.vendor.try(:name) %></td>
            <% end %>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'user_vendors_sku_header',
    replace: 'tr[data-hook="admin_products_index_headers"] th:first',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) || vendors_sku %>
                <th><%= Spree.t(:sku) %></th>
            <% end %>
          HTML
)

Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'user_vendors_sku_body',
    replace: "td.sku",
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) || vendors_sku %>
                <td class="sku"><%= product.sku rescue '' %></td>
            <% end %>
          HTML
)
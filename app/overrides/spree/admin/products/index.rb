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
Deface::Override.new(
    virtual_path: 'spree/admin/variants/_form',
    name: 'make_variant_price_readonly',
    replace: "erb[loud]:contains('f.text_field :price')",
    text: "<%= f.text_field :price, value: number_to_currency(@variant.price, unit: ''), class: 'form-control', readonly: true %>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/variants/_form',
    name: 'add_variant_cost_price_required_span',
    replace: "erb[loud]:contains('f.label :cost_price')",
    text: "<%= f.label :cost_price, raw(Spree.t(:cost_price) + required_span_tag) %>"
)

Deface::Override.new(
    virtual_path: 'spree/admin/variants/_form',
    name: 'make_variant_cost_price_required',
    replace: "erb[loud]:contains('f.text_field :cost_price')",
    text: "<%= f.text_field :cost_price, 
                             value: number_to_currency(@variant.cost_price, unit: ''),
                             class: 'form-control',
                             required: true,
                             oninvalid: \"this.setCustomValidity('Completa este campo')\",
                             oninput: \"setCustomValidity('')\" %>"
)

Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  name: 'show_variant_commission',
  insert_after: 'div[data-hook="cost_price"]',
  text: <<-HTML
          <% if @product.vendor %>
            <div id="vendor-commission" style="display: none;">
              <%= @product.vendor.commission_rate %>
            </div>
          <% end %>
        HTML
)
Deface::Override.new(
    virtual_path: 'spree/admin/orders/index',
    name: 'display_vendor_total',
    replace: "erb[loud]:contains('order.display_total.to_html')",
    text: "<%= current_spree_vendor ? order.display_multi_vendor_total(current_spree_user).to_html : order.display_total.to_html %>"
)
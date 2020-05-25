$().ready(function($) {
  if ( $('[data-hook="new_product"]').length ||
       $('[data-hook="admin_product_form_vendor"]').length ||
       $('[data-hook="admin_variant_form_fields"]').length ) {
    $('#product_vendor_id').on("change", function(){ GetVendorCommission($(this).val()) })
    $("#product_price").on("change", function(){ ProductNoCentsAndCommission("price") })  
    $("#product_cost_price").on("change", function(){ ProductNoCentsAndCommission("cost") })
    $("#variant_price").on("change", function(){ VariantNoCentsAndCommission("price") })
    $("#variant_cost_price").on("change", function(){ VariantNoCentsAndCommission("cost") })    
  }
})


function GetVendorCommission(vendor) {
  $.ajax({
    url: Spree.pathFor('admin/vendor_commission'),
    method: 'get',
    dataType: 'json',
    data: { vendor },
    success: function(data) {
      $("#vendor-commission").html(data.commission)
      ProductNoCentsAndCommission("vendor")
    }
  })
  return false
}


function ProductNoCentsAndCommission(caller) {
  var productCostPrice = $("#product_cost_price")
  var productPrice = $("#product_price")

  var cost = parseFloat(productCostPrice.val())
  var price = parseFloat(productPrice.val())
  var comm = parseFloat($("#vendor-commission").text())

  if ($.isNumeric(comm) && (["cost", "vendor"].indexOf(caller) != -1) && $.isNumeric(cost) ) {
    cost = Math.round(cost)
    productCostPrice.val(cost)
    price = Math.round(cost*(100+comm)/100)
    productPrice.val(price)
  }

  if ($.isNumeric(comm) && (caller == "price") && $.isNumeric(price) ) {
    price = Math.round(price)
    productPrice.val(price)
    cost = Math.round(100*price/(100+comm))
    productCostPrice.val(cost)
  }
}


function VariantNoCentsAndCommission(caller) {
  var variantCostPrice = $("#variant_cost_price")
  var variantPrice = $("#variant_price")

  var cost = parseFloat(variantCostPrice.val())
  var price = parseFloat(variantPrice.val())
  var comm = parseFloat($("#vendor-commission").text())

  if ($.isNumeric(comm) && (caller == "cost") && $.isNumeric(cost) ) {
    cost = Math.round(cost)
    variantCostPrice.val(cost)
    price = Math.round(cost*(100+comm)/100)
    variantPrice.val(price)
  }

  if ($.isNumeric(comm) && (caller == "price") && $.isNumeric(price) ) {
    price = Math.round(price)
    variantPrice.val(price)
    cost = Math.round(100*price/(100+comm))
    variantCostPrice.val(cost)
  }
}
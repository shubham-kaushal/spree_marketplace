$().ready(function($) {
  if ( $('[data-hook="new_product"]').length ||
       $('[data-hook="admin_product_form_vendor"]').length ||
       $('[data-hook="admin_variant_form_fields"]').length ) {
    $('#product_vendor_id').on("change", function(){ GetVendorCommission($(this).val()) })
    $("#product_cost_price").on("change", function(){ ProductNoCentsAndCommission() })
    $("#variant_cost_price").on("change", function(){ VariantNoCentsAndCommission() })    
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
      ProductNoCentsAndCommission()
    }
  })
  return false
}


function ProductNoCentsAndCommission() {
  var productCostPrice = $("#product_cost_price")
  var costPrice = parseFloat(productCostPrice.val())
  var commission = parseFloat($("#vendor-commission").text())

  if ($.isNumeric(costPrice) && $.isNumeric(commission)) {
    costPrice = Math.round(costPrice)
    productCostPrice.val(costPrice)

    sellPrice = Math.round(costPrice*(100+commission)/100)
    $("#product_price").val(sellPrice)
  }
}


function VariantNoCentsAndCommission() {
  var variantCostPrice = $("#variant_cost_price")
  var costPrice = parseFloat(variantCostPrice.val())
  var commission = parseFloat($("#vendor-commission").text())

  if ($.isNumeric(costPrice) && $.isNumeric(commission)) {
    costPrice = Math.round(costPrice)
    variantCostPrice.val(costPrice)

    sellPrice = Math.round(costPrice*(100+commission)/100)
    $("#variant_price").val(sellPrice)
  }
}
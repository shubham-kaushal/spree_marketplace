$(function () {
  var variantSellPrice = $("div[data-hook='admin_variant_form_fields'] #variant_price")
  var variantCostPrice = $("div[data-hook='admin_variant_form_fields'] #variant_cost_price")

  var commission = parseFloat($("#vendor-commission").text())

	variantSellPrice.on("change", { motion: "sub" }, VariantNoCentsAndCommission)
  variantCostPrice.on("change", { motion: "add" }, VariantNoCentsAndCommission)


  function VariantNoCentsAndCommission(event) {
  	var sellPrice = Math.round(parseFloat(variantSellPrice.val()))
  	var costPrice = Math.round(parseFloat(variantCostPrice.val()))

  	if (event.data.motion == "sub") {
  		variantSellPrice.val(sellPrice)
  		if (commission) {
  			costPrice = Math.round(sellPrice*(100-commission)/100)
  			variantCostPrice.val(costPrice)
  		}
  	}
  	if (event.data.motion == "add") {
  		variantCostPrice.val(costPrice)
  		if (commission) {
	  		sellPrice = Math.round(costPrice*(100+commission)/100)
  			variantSellPrice.val(sellPrice)
  		}
  	}
	}

})
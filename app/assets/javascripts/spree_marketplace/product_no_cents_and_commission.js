$(function () {
  var productSellPrice = $("div[data-hook='admin_product_form_price'] #product_price")
  var productCostPrice = $("div[data-hook='admin_product_form_cost_price'] #product_cost_price")

  var commission = parseFloat($("#vendor-commission").text())

	productSellPrice.on("change", { motion: "sub" }, ProductNoCentsAndCommission)
  productCostPrice.on("change", { motion: "add" }, ProductNoCentsAndCommission)


  function ProductNoCentsAndCommission(event) {
  	var sellPrice = Math.round(parseFloat(productSellPrice.val()))
  	var costPrice = Math.round(parseFloat(productCostPrice.val()))

  	if (event.data.motion == "sub") {
  		productSellPrice.val(sellPrice)
  		if (commission) {
  			costPrice = Math.round(sellPrice*(100-commission)/100)
  			productCostPrice.val(costPrice)
  		}
  	}
  	if (event.data.motion == "add") {
  		productCostPrice.val(costPrice)
  		if (commission) {
	  		sellPrice = Math.round(costPrice*(100+commission)/100)
  			productSellPrice.val(sellPrice)
  		}
  	}
	}

})
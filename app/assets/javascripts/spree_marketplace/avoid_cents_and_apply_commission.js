$(function () {
  var sellPriceInput = $("div[data-hook='admin_product_form_price'] #product_price")
  var costPriceInput = $("div[data-hook='admin_product_form_cost_price'] #product_cost_price")

  var commission = parseFloat($("#vendor-commission").text())

	sellPriceInput.on("change", { motion: "sub" }, AvoidAndApply)
  costPriceInput.on("change", { motion: "add" }, AvoidAndApply)

  function AvoidAndApply(event) {
  	var sellPrice = Math.round(parseFloat(sellPriceInput.val()))
  	var costPrice = Math.round(parseFloat(costPriceInput.val()))

  	if (event.data.motion == "sub") {
  		sellPriceInput.val(sellPrice)
  		if (commission) {
  			costPrice = Math.round(sellPrice*(100-commission)/100)
  			costPriceInput.val(costPrice)
  		}
  	}
  	if (event.data.motion == "add") {
  		costPriceInput.val(costPrice)
  		if (commission) {
	  		sellPrice = Math.round(costPrice*(100+commission)/100)
  			sellPriceInput.val(sellPrice)
  		}
  	}
	}

})
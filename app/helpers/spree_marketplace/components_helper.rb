module SpreeMarketplace
	module ComponentsHelper

		def backendx_available?
    	SpreeMarketplace::Engine.backendx_available?
  	end
  	
  end
end
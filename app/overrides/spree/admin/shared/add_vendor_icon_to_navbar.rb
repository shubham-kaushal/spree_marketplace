if defined?(current_spree_vendor)
	Deface::Override.new(
  	virtual_path: "spree/shared/_nav_bar",
  	name: "add_vendor_icon_to_navbar",
  	insert_before: "li#link-to-cart",
  	partial: "spree/shared/vendor_icon",
		original: 'c7ed5f9376c3d409d472aadefa98edf54d56cd27' 
	)
end
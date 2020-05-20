include SpreeMarketplace::ComponentsHelper

if backendx_available?
	Deface::Override.new(
  	virtual_path: 'spree/admin/shared/_mobile_navigation',
  	name: 'display_configuration_tab_for_vendors_if_backendx',
  	replace: 'erb[silent]:contains("current_store")',
  	text: '<% if can?(:admin, current_store) || current_spree_user.vendors.any? %>'
	)

	Deface::Override.new(
  	virtual_path: 'spree/admin/shared/_mobile_navigation',
  	name: 'add_vendors_tab_to_main_menu_if_backendx',
  	insert_bottom: '.mobile-navigation-list',
  	partial: 'spree/admin/shared/vendors_mobile_tab'
	)
end
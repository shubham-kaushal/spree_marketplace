Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :vendors do
      collection do
        post :update_positions
      end
    end
    resources :vendor_settings, only: [:index, :edit, :update]
#    get 'vendor_settings' => 'vendor_settings#edit'
#    patch 'vendor_settings' => 'vendor_settings#update'
    get 'vendor_commission' => 'vendor_settings#commission'
  end
end

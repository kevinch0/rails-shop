Rails.application.routes.draw do
  resources :orders
  resources :order_products
  resources :products
  resource :cart, only: [:show]
  devise_for :users, :controllers => { :registrations => 'accounts' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end

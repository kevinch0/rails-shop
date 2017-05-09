Rails.application.routes.draw do
  resources :orders
  resources :order_products
  resources :products
  devise_for :users
  # devise_for :users :controllers => { sessions: 'users/sessions'}
  resource :cart, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end

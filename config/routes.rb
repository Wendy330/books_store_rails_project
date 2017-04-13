Rails.application.routes.draw do
  get 'signup/sign_up'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'

  resources 'products' do
    member do
      post :add_to_cart
      post :proceed_to_checkout
      post :remove_from_cart
    end
  end

  resources 'searches'

  get 'added_to_shopping_cart' => 'products#added_to_shopping_cart', as: 'added_to_shopping_cart'
  get 'about' => 'about_page#index', as: 'about'
  get 'contact' => 'contact_page#index', as: 'contact'
  get ':id' => 'products#by_category', as: 'categories', id: /\d+/


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

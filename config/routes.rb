Rails.application.routes.draw do


  get 'sessions/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'

  resources 'products' do
    member do
      post :add_to_cart
      post :update_quantity
      post :checkout
      post :remove_from_cart
      post :calculate_total
    end
  end

  resources 'searches'

  get 'added_to_shopping_cart' => 'products#added_to_shopping_cart', as: 'added_to_shopping_cart'
  get 'checkout' => 'products#checkout', as: 'checkout'
  get 'order_confirmation' => 'products#order_confirmation', as: 'order_confirmation'
  get 'about' => 'about_page#index', as: 'about'
  get 'contact' => 'contact_page#index', as: 'contact'
  get ':id' => 'products#by_category', as: 'categories', id: /\d+/

  get 'signup' => 'customers#new', as: 'signup'

  get   '/login' => 'sessions#new'
  post  '/login' => 'sessions#create'
  get   '/logout' => 'sessions#destroy'

  resources :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

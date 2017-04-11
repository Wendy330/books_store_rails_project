Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'

  resources 'products', only: [:index, :show] do
    member do
      post :add_to_cart
      post :mark_as_added
    end
  end

  resources 'searches'

  get 'about' => 'about_page#index', as: 'about'
  get 'contact' => 'contact_page#index', as: 'contact'
  get ':id' => 'products#by_category', as: 'categories'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

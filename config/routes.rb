Rails.application.routes.draw do

  get 'about' => 'about_page#index', as: 'about'
  get 'contact' => 'contact_page#index', as: 'contact'

  get ':id' => 'products#by_category', as: 'categories'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]
  resources 'searches'

  root to: 'products#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # get 'product_controller/index'
  #
  # get 'product_controller/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources 'products', only: [:index, :show]

  root to: 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

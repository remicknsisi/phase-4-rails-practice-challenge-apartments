Rails.application.routes.draw do
  resources :apartments, only: [:create, :index, :update, :destroy]
  resources :tenants, only: [:create, :index, :update, :destroy]
  resources :lease, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

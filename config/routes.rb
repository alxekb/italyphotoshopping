Rails.application.routes.draw do
  resources :bulletins
  get 'order/show'
  get 'order/create'
  get 'order/new'
  root 'items#index'
  devise_for :models
  resources :items
  resources :shop
  resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

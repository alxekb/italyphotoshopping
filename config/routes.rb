Rails.application.routes.draw do
  root 'items#index'
  # get 'profile/new'
  # get 'profile/index'
  # get 'profile/show'
  # get 'profile/edit'
  # get 'profile/update'
  # get 'order/show'
  # get 'order/create'
  # get 'order/new'
  devise_for :admins
  devise_for :users
    as :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  resources :profile
  resources :packages
  resources :bulletins
  resources :items
  resources :shop
  resources :reviews
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

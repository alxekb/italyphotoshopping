Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # root 'items#index'
  root 'welcome#index'
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

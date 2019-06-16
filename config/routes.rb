Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :profiles
      resources :brands
      resources :bulletins
      resources :clients
      resources :items
      resources :orders
      resources :packages
      resources :models
      resources :item_names
      resources :colors
      resources :sizes
      resources :deals

      # resources :reviews

      root to: "brands#index"
    end
  resources :packages, :bulletins, :items, :shop, :reviews, :orders, :deals

  get 'pds', to: 'packages#point_description'
  get 'boxberry', to: 'boxberry#index'

  namespace :profile do
    resources :items, controller: 'item'
    resources :deals
    resources :clients
  end

  devise_for :users, controllers: { confirmations: 'confirmations' }
    as :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  scope module: :profile, as: :profile, path: 'profile' do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    get 'dashboard/edit', to: 'dashboard#edit'
    patch 'dashboard', to: 'dashboard#update'
    resources :admin
    # resources :dashboard
    # resources :clients
  end

  root 'welcome#index'
end

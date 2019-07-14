Rails.application.routes.draw do

  get 'batches/index'
  get 'batches/new'
  get 'batches/create'
  get 'batches/show'
  get 'batches/update'
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
  resources :packages, :bulletins, :items, :shop, :reviews, :orders, :deals, :batches
  resources :profiles, controller: 'users'

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
      get '/users/sign_in' => 'devise/sessions#create'
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
  namespace :api, defaults: { format: 'json' } do
    get 'points', to: 'boxberry#list_points'
    get 'point', to: 'boxberry#point'
    get 'city', to: 'boxberry#city'
  end
end

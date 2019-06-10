Rails.application.routes.draw do

  resources :packages, :bulletins, :items, :shop, :reviews, :orders

  namespace :profile do
    resources :items
    resources :deals
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
    resources :clients
  end

  root 'welcome#index'
end

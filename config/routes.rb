Rails.application.routes.draw do
  namespace :admin do
      # resources :admins
      resources :users
      resources :brands
      resources :bulletins
      resources :items
      resources :orders
      resources :packages
      resources :profiles
      # resources :reviews

      root to: "users#index"
    end
  root 'welcome#index'
  devise_for :users
    as :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  resources :packages, :bulletins, :items, :shop, :reviews, :orders

  scope module: :profile, as: :profile, path: 'profile' do
    # get 'dashboard', to: 'dashboard#index', as: :dashboard
    resources :admin
    resources :dashboard
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

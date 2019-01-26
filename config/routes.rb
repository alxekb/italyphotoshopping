Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :admins, :users
    as :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  resources :profile, :packages, :bulletins, :items, :shop, :reviews, :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

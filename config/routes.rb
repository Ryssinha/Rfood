require 'sidekiq/web'
Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :chefs
  resources :customers
  resources :dishes
  resources :categories
  resources :orders
  resources :order_items

  resources :coupons, only: [:index, :show] do
    resources :orders, only: [:index]
  end

  resources :payments, only: [:index, :show] do
    resource :customer, only: [:show]
  end

  resources :states, only: [:index, :show] do
    resources :cities, only: [:index]
  end

  mount Sidekiq::Web => '/sidekiq'
end

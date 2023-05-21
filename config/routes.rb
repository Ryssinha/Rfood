Rails.application.routes.draw do

  resources :chefs #, only: [:index, :show] do
  #   resource :address, only: [:show]
  #   resource :city, only: [:show]
  #   resource :state, only: [:show]
  #   resources :telephones, only: [:index]
  #   resources :dishes, only: [:index]
  # end


  resources :coupons, only: [:index, :show] do
    resources :orders, only: [:index]
  end


  resources :customers#, only: [:index, :show] do
  #   resources :orders, only: [:index]
  #   resources :addresses, only: [:index, :show]
  #   resources :telephones, only: [:index]
  #   resources :cards, only: [:index, :show]
  # end

  resources :dishes#, only: [:index, :show] do
  #   resources :categories, only: :index
  # end
  resources :categories


  resources :orders#, only: [:index, :show] do
  #   resources :order_items, only: [:show, :index]
  #   resources :dishes, only: [:index, :show]
  #   resource :city, only: [:show]
  #   resource :payment, only: [:show]
  # end

  resources :payments, only: [:index, :show] do
    resource :customer, only: [:show]
  end

  resources :states, only: [:index, :show] do
    resources :cities, only: [:index]
  end
end

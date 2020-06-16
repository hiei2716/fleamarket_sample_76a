Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credit_cards, only: [:new]
  resources :purchase, only: [:index]
  resources :items, only: [:index, :new, :show]

  resources :categories, only: :show
end

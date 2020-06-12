Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end

  resources :items, except: [:index] do
    collection do
      get 'category_children', defaults: {format: 'json'}
      get 'category_grandchildren', defaults: {format: 'json'}
    end
  end

  resources :credit_cards, only: [:new]
  resources :purchase, only: [:index]
  resources :items, only: [:index, :new, :show]
end

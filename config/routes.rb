Rails.application.routes.draw do
  root 'items#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
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
  resources :items, only: [:index, :new, :show, :edit, :update]
  resources :categories, only: :show
  resources :images, only: [:index, :new, :show]
end



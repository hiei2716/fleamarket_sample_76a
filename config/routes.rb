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
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :categories, only: :show
  resources :images, only: [:index, :new, :show]
end



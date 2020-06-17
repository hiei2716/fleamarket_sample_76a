Rails.application.routes.draw do
  devise_for :users
  root 'items#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :credit_cards, only: [:index, :new, :create, :show] do
    collection do
      post 'new', to: 'credit_cards#new'
      post 'pay', to: 'credit_cards#pay'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :items, only: [:index, :new, :show] do
    collection do
      post 'pay'
    end
  end
  resources :images, only: [:index, :new, :show]
end

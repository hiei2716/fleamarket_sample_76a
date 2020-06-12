Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :credit_cards, only: [:new]
  resources :purchase, only: [:index]
  get 'items/edit', to: 'items#edit' #商品情報編集ページへの遷移のため
  resources :items, only: [:index, :new, :show, :edit, :update]
end

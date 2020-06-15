Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#top'
  get 'users/sign_up', to: 'registrations#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :credit_cards, only: [:new]
  resources :purchase, only: [:index]
  resources :items, only: [:index, :new, :show]
  resources :images, only: [:index, :new, :show]
end



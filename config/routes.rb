Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :new]
  resources :purchase, only: [:index]
end
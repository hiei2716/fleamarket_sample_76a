Rails.application.routes.draw do
  root 'items#index'
  resources :purchase, only: [:index]
end

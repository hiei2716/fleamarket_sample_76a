Rails.application.routes.draw do
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/logout" => "users#logout"
  get "credit_cards/new" => "credit_cards#new"
  resources :purchase, only: [:index]
end

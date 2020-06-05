Rails.application.routes.draw do
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get "logout" => "users#logout"
  resources :credit_cards
  get "new" => "credit_cards#new"
end

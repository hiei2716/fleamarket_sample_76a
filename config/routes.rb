Rails.application.routes.draw do
  root 'items#index'

  get 'new', to: 'items#new'

end
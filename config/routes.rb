Rails.application.routes.draw do
  root 'items#index'
<<<<<<< HEAD

  get 'new', to: 'items#new'

end
=======
  resources :purchase, only: [:index]
end
>>>>>>> master

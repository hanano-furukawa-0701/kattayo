Rails.application.routes.draw do
  
  root 'home#index'

  resources :items, only: [:index, :new, :create]
end

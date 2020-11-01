Rails.application.routes.draw do
  
  root 'home#index'

  resources :items, only: [:index]
end

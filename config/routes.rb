Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'target_amounts', to: 'users/registrations#new_target_amounts'
    post 'target_amounts', to: 'users/registrations#create_target_amounts'
  end
  
  root 'home#index'

  resources :items, only: [:index, :new, :create]
end

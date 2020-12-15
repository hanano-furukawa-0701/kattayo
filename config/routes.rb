Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'target_amounts', to: 'users/registrations#new_target_amounts'
    post 'target_amounts', to: 'users/registrations#create_target_amounts'
  end

  root 'home#index'
  resources :users, only: [:edit, :update]


  resources :target_amounts, only: [:edit, :update]

  resources :items, only: [:index, :new, :create, :edit, :update, :destroy] 

  scope :items do
    resources :categories, only: [:show, :update, :destroy]
  end
  

  resources :categories, only: [:new, :create, :edit]
end

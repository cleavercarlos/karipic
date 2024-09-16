Rails.application.routes.draw do
  get "render/index"
  root 'pictures#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :pictures do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]
end
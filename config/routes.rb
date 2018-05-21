Rails.application.routes.draw do
  resources :users
  resources :expeditions
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resource :expeditions, only: [:show, :create, :new, :destroy]
  resource :users, only: [:show, :create, :new, :destroy]

  root to: "home#show"
end

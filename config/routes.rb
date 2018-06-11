Rails.application.routes.draw do
  get 'work/work'
  get 'trainer/training'
  resources :fights
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
  get '/home', to: 'fight#challenge_fight', as: 'challenge_fight'
  post "trainer/incrementStrength" => "trainer#incrementStrength"
  post "trainer/incrementAttack" => "trainer#incrementAttack"
  post "trainer/incrementDefence" => "trainer#incrementDefence"
  post "trainer/incrementAgility" => "trainer#incrementAgility"
  get "trainer/training" => "trainer#training"
  get "work/work" => "work#work"


end

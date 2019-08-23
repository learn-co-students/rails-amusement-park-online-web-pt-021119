Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :attractions
  resources :users

resources :admins, only: [:show]


  root :to => 'static#welcome'


end

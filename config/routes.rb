Rails.application.routes.draw do
  resources :users
  root 'sessions#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :admins, only: [:show]
  resources :attractions
end

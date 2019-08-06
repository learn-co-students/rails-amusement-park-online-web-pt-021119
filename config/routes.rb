Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/update'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'attractions/index'
  get 'attractions/show'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/edit'
  get 'attractions/update'
  get 'admins/show'
  resources :users
  root 'sessions#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :admins, only: [:show]
  resources :attractions

end
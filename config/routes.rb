Rails.application.routes.draw do
  
  root 'sessions#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'

  resources :attractions
  resources :users

end

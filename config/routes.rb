Rails.application.routes.draw do
  root 'users#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  post '/take_ride' => 'attractions#take_ride'

  resources :users
  resources :rides
  resources :attractions
end

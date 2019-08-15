Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :attractions, :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/logout' => 'sessions#destroy'


  root 'sessions#new'
end

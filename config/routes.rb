Rails.application.routes.draw do
  resources :attractions
  resources :users
  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  resources :users do 
    resources :attractions
  end 

  resources :admins, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

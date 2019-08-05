Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, :attractions, :rides
root to: 'users#new'

get '/signup', to: 'user#new'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
post '/logout', to: 'sessions#destroy'

post '/rides', to: 'rides#create'
end

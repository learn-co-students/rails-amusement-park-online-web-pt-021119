Rails.application.routes.draw do

	root 'static#home'

  resources :rides
  resources :attractions
	resources :users

	get '/signin', to: "sessions#signin"
	post '/signin', to: "sessions#create"
	delete '/sessions', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

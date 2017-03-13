Rails.application.routes.draw do
  root 'users#index'
  get  '/signup',  to: 'users#new'
	resources :users

	
	get '/login', to: 'sessions#new'
	post '/sessions', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

	get '/libraries', to: 'libraries#index'
	post '/libraries', to: 'libraries#create'
	get '/libraries/new', to: 'libraries#new', as: 'new_library'

	get '/users/:user_id/libraries', to: 'library_users#index', as: 'user_libraries'
	post '/libraries/:library_id/users', to: 'library_users#create', as: 'library_users'
end

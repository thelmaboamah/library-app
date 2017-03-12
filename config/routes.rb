Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
	resources :users

	
	get '/login', to: 'sessions#new'
	# post '/sessions', to: 'sessions#create'
	resources :sessions
end

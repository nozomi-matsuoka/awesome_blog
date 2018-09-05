Rails.application.routes.draw do
	root "static_pages#home"
	get "/signup", to: "users#new"
	post "/signup", to: "users#create"
	get "/about", to: "static_pages#about"
	# get "/users/:id", to: "users#show" 

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/login", to: "sessions#destroy"

	get "/index", to: "users#index"

	resources :users, except: :new
	resources :microposts, only: :create
	resources :relationships, only: [:create, :destroy]
end
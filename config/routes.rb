Rails.application.routes.draw do

  
  root 'sessions#new' # page d'accueil
  resources :gossips
	resources :users
	resources :cities, only: [:show]
	resources :contact, only: [:index]
	resources :team, only: [:index]
	resources :sessions, only: [:new, :create, :destroy]

  



end



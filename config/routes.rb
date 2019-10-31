Rails.application.routes.draw do

  
  root 'gossips#index' # page d'accueil
  resources :gossips do
		resources :comments
	end
	resources :users
	resources :cities, only: [:show]
	resources :contact, only: [:index]
	resources :team, only: [:index]

  


=begin
	get 'static_page/contact'
  get 'static_page/team'
  get 'users/show'
  get 'team', to: 'static_pages#team' #Page team
  get 'contact', to: 'static_pages#contact' #PAge contact
  get 'welcome/:name', to: 'static_pages#welcome' #Page secrete selon le nom entré aprés welcome/


  get 'gossips/:id', to: 'gossips#display'   #afficher un potin 
  get '/:user', to: 'gossips#user'   #afficher un user 

  get 'user/index'
  get 'user/show'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  get 'contact/index'
  
=end

end



Rails.application.routes.draw do

  root 'static_pages#index' # page d'accueil
  get 'team', to: 'static_pages#team' #Page team
  get 'contact', to: 'static_pages#contact' #PAge contact
  get 'welcome/:name', to: 'static_pages#welcome' #Page secrete selon le nom entré aprés welcome/
  get 'gossips/:id', to: 'gossips#display'   #afficher un potin 
  get '/:user', to: 'gossips#user'   #afficher un user 


end



class GossipsController < ApplicationController

	def index
		@gossips = Gossip.order(:id).all
	end

	def show
		#on selectionne le gossip avec l'id récupéré en home
		@gossip = Gossip.find(params[:id]) #ou params["id"]
	end	

	def edit
		#on récupère l'article affiché pour le modifier
		@gossip = Gossip.find(params[:id])
	end


	def update
		#on récupère l'article affiché pour le modifier
		@gossip = Gossip.find(params[:id])
		@gossip.update(post_params)
		#aprés la mise à jour on revient sur la page gossips
		redirect_to gossips_path
	end


 	def new
		@gossip = Gossip.new
	end


	def create
		# avec les données obtenues à partir du formulaire
		@gossip = Gossip.new(title: post_params[:title], content: post_params[:content], user_id: User.first.id)
		@gossip.user = User.find_by(id: session[:user_id])

	  if @gossip.save # essaie de sauvegarder en base @gossip
	    # si ça marche, il redirige vers la page d'index du site
	    flash[:success] = "Potin bien créé !"
	    redirect_to gossips_path 

	  else
	    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  		flash[:error] = "Erreur à la création du potin !"
  		render 'new'

	  end
	end


	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
		
	end


	def user
		#on selectionne le user correspondant au gossip en consultation
		@user_display = User.find_by(first_name: params["user"])
	end


	private


	def post_params
		post_params = params.require(:gossip).permit(:title, :content)
	end


end
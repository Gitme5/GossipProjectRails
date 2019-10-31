class GossipsController < ApplicationController

	def index
		@gossips = Gossip.all
		# @gossips = []
  	# Gossip.all.each do |my_gossip|
    # 	@gossips << {author: my_gossip.user.first_name, title: my_gossip.title, user_id: my_gossip.user.id, gossip_id: my_gossip.id}
		# end
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
		#@gossip = Gossip.create!(user: User.all.sample, title: params[:title], content: params[:content]) 

	  if @gossip.save # essaie de sauvegarder en base @gossip
	    # si ça marche, il redirige vers la page d'index du site
	    redirect_to gossips_path
	    #redirect_to root_path
	    #redirect_to "http://localhost:3000"  

	  else
	    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  		render 'new'

	  end
	end


	def post_params
		post_params = params.require(:gossip).permit(:title, :content)
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


end
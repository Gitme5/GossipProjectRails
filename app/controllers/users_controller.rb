class UsersController < ApplicationController

	def index
		@users = User.all
		
	end

	def new
		@user = User.new
		
	end

	def create
		city = City.create(name: params[:city])
		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], description: params[:description], age: params[:age], city: city, password: params[:pswd])

	  if @user.save # essaie de sauvegarder en base @gossip
	    # si ça marche, il redirige vers la page d'index du site
	    redirect_to gossips_path

	  else
	    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  		render 'new'
		
		end
	end

	def show
		@user = User.find(params[:id].to_i)
		
	end

=begin Si problème avec permit: false
	private

	def post_params
		post_params = params.require(:user).permit(:first_name, last_name :content)
	end
=end


end

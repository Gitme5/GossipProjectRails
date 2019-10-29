class GossipsController < ApplicationController

	def display
		#on selectionne le gossip avec l'id récupéré en home
		@gossip_display = Gossip.find(params["id"])

	
	end	

	def user
		#on selectionne le user correspondant au gossip en consultation
		@user_display = User.find_by(first_name: params["user"])
	end



end
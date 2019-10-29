class StaticPagesController < ApplicationController
  
  def index
  	@gossips = []
  	Gossip.all.each do |my_gossip|
      @gossips << {author: my_gossip.user.first_name, title: my_gossip.title, user_id: my_gossip.user.id, gossip_id: my_gossip.id}
    end

  end

  def team
  	puts "Hello je suis la page Team"
  end

  def contact
 		puts "Hello je suis la page Contact"
  end


  def welcome
  	@user = params[:name]

  end

end

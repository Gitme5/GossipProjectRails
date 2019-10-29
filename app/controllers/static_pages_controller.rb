class StaticPagesController < ApplicationController
  
  def index
  	puts ""
  	puts "Helo je suis le WELCOME"
  	puts "$" * 60 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
  	puts "FUUUUUCK" #tu sais que params doit s'afficher entre les 2
  	puts "$" * 60
  	puts ""
  	puts ""
  	puts ""
  	puts ""
  	puts "$" * 60
  	puts "$" * 60
  	@gossips = []
  	Gossip.all.each do |my_gossip|
      @gossips << {author: my_gossip.user.first_name, title: my_gossip.title, user_id: my_gossip.user.id, gossip_id: my_gossip.id}
    end
  	puts "$" * 60

  end
=begin
def accueil
    @first_name = params[:first_name]
    @gossips = []
    Gossip.all.each do |my_gossip|
      @gossips << {author: my_gossip.user.first_name, title: my_gossip.title, user_id: my_gossip.user.id}
​
    end
  end

  	users = User.where(first_name: 'David', is_admin: true).order(created_at: :desc)
=end




  def team
  	puts "Hello je suis la page Team"
  end


  def contact
 		puts "Hello je suis la page Contact"
  end


  def welcome
  	puts ""
  	puts ""
  	puts ""
  	puts "Helo je suis le WELCOME"
  	puts "$" * 60 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
  	puts params #tu sais que params doit s'afficher entre les 2
  	puts "$" * 60
  	puts ""
  	@user = params[:name]
  	puts ""
  	puts ""

  end

end

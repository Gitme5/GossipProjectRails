class SessionsController < ApplicationController


	def new
		@user = User.new
		
	end


	def create
		# cherche s'il existe un utilisateur en base avec l’e-mail
	  @user = User.find_by(email: params[:email])

	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if @user && @user.authenticate(params[:pswd])
	    session[:user_id] = @user.id
	    #log_in(user)
	    flash[:success] = "Connexion réussie"
    	redirect_to gossips_path
	  else
	    flash[:error] = 'Invalid email/password combination'
	    render 'new'
	  end
	end


	def destroy
		session.delete(:user_id)
		flash[:success] = "Déconnexion réussie"
		redirect_to new_session_path
	end

end

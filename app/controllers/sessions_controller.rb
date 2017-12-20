class SessionsController < ApplicationController
	def create
		p params
		auth_hash = request.env['omniauth.auth']

  		p auth_hash.inspect

  		@user = User.find_or_create_from_auth_hash(auth_hash)
  		session[:user_id] = @user.id
  		redirect_to :me
  	end

  	def new
  	end

  	def destroy
  		session[:user_id] = nil
  		redirect_to root_path
  	end


end

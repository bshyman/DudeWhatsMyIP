class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    p "SESSSIONED"
    p session[:user_id]
    p current_user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

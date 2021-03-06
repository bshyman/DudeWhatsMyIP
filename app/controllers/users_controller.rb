class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :set_example, only: [:create]
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)


    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def current_user_route
    render json: {user: current_user}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_example
      @interface = Interface.create(ip: '192.168.1.1', hostname: 'localhost', port: '3000', ddns: 'myrouter.me.net', user_id: current_user.id)
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email)
    end
end

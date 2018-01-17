class InterfacesController < ApplicationController
  respond_to :html, :js
  skip_before_action  :verify_authenticity_token

  def index
    @interfaces = Interface.order('created_at DESC')
  end

  def show
    @interface = Interface.find(params[:id])
    if request.xhr?
      render json: @interface, layout: false
    end
  end

  def new
  end

  def create
    @interface = Interface.new(interface_params)
    @interface.user_id = current_user.id
    if @interface.save
      if request.xhr?
        render json: @interface, layout:false
      else
        redirect_to root_path
      end
    else
      @interface.errors.full_messages.each{|error| p error }
      flash[:error] = "Error - check server logs"
    end
  end

  def destroy
    @interface = Interface.find(params[:id])
    if request.xhr?
      @interface.to_json
      @interface.destroy
    else
      @interface.destroy
      redirect_to root_path
    end
  end

  private
  def interface_params
    params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes, :user_id)
  end

end

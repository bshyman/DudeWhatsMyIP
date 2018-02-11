class InterfacesController < ApplicationController
  # respond_to :html, :js
  skip_before_action  :verify_authenticity_token
  before_action :set_interface, except: [:index, :new, :create]

  def index
    @interfaces = Interface.order('created_at DESC')
  end

  def show
    if request.xhr?
      render json: @interface, layout: false
    end
  end

  def new
  end

  def edit
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

def update
    respond_to do |format|
      @interface.assign_attributes(interface_params)
      if @interface.save
        format.html { redirect_to user_interfaces_path, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @interface }
      else
        format.html { render :edit }
        format.json { render json: @interface.errors, status: :unprocessable_entity }
      end
    end
end


  def destroy
    if request.xhr?
      @interface.to_json
      @interface.destroy
    else
      @interface.destroy
      redirect_to root_path
    end
  end

  def set_interface
      @interface = Interface.find(params[:id])

  end

  private
  def interface_params
    params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes, :user_id)
  end

end

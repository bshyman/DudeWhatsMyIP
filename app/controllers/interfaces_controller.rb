# frozen_string_literal: true

class InterfacesController < ApplicationController
  respond_to :html, :js, :json
  skip_before_action :verify_authenticity_token
  # before_filter :authenticate

  def index
    # authenticate
    @interfaces = Interface.order('created_at DESC')
  end

  def show
    @interface = Interface.find(params[:id])
    render json: @interface if request.xhr?
  end

  def new
    @interface = Interface.new
    respond_to do |format|
      format.html
      # format.json  { render :json => @interface }
    end
    render 'new', layout: false
  end

  def edit
    @interface = Interface.find_by(id: params[:id], user_id: params[:user_id])
    respond_to do |format|
      format.html  { render :_edit, layout: false, locals: {interface: @interface} }
      format.json  { render json: @interface }
    end
  end

  def update
    @interface = Interface.find(interface_params)
    @interface.assign_attributes(interface_params)
    if @interface.save
      respond_to do |format|
        format.html
        format.json { render json: @interface }
      end
    else
      flash[:error] = 'ERRRRRRR'
      redirect_to root_path
    end
  end

  def create
    @interface = Interface.new(interface_params)
    @interface.assign_attributes(user_id: session[:user_id])
    if @interface.save
      if request.xhr?
        render json: @interface, layout: false
      else
        redirect_to user_interfaces_path(@interface.user_id)
      end
    else
      @interface.errors.full_messages.each { |error| p error }
      flash[:error] = 'Error - check server logs'
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

class InterfacesController < ApplicationController
	respond_to :html, :js

	def index
		@interfaces = Interface.order('created_at DESC')
	end

	def show
		@interface = Interface.find(params[:id])
		render json: @interface, layout: false
	end

	def new
	end

	def create
		p params
		@interface = Interface.new(interface_params)
		if @interface.save
			if request.xhr?
				render json: @interface
			else
				redirect_to root_path
			end
		else
			p "DATABASE SAVE ERRROR"
			flash[:error] = "ERROR"
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
      params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes)
    end

end

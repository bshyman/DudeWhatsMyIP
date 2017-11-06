class InterfacesController < ApplicationController
	respond_to :html, :js

	def index
		@interfaces = Interface.all
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
				p "AJJJJJAX"
				render json: @interface
			else
				p "UGHHH"
			end
		else
			p "DATABASE ENTRY ERRROR"
		end
	end

	def destroy
		@interface = Interface.find(params[:id])
		if request.xhr?
			@interface.to_json
			@interface.destroy
		else
			p "IN ELLLLLLLSE"
		end

	end

  private
    def interface_params
      params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes)
    end

end

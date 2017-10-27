class InterfacesController < ApplicationController
	def index
		@interfaces = Interface.all
	end

	def show
		@interface = Interface.find(params[:id])
		render @interface.as_json, layout: false
	end
	def new
	end

	def create
		p params
		@interface = Interface.new(interface_params)
		if @interface.save
			if request.xhr?
				p "AJJJJJAX"
				@interface.as_json
			else
				p "UGHHH"
				# redirect_to root_path 
			end
		else
			p "DATABASE ENTRY ERRROR"
		end
	end

	def destroy
		@interface = Interface.find(params[:id])
		if request.xhr?
			@interface.to_json
			# @interface.destroy
		else
			p "IN ELLLLLLLSE"
		end

	end


  private
    def interface_params
      params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes)
    end


end

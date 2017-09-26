class InterfacesController < ApplicationController

	def index
		@interfaces = Interface.all
	end

	def show
	end
	def new
	end

	def create
		@interface = Interface.new(interface_params)
		@interface.save
		render 'index'
	end


  private
    def interface_params
      params.require(:interface).permit("ip", :hostname, :port, :ddns)
    end


end

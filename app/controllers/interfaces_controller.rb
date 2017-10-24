class InterfacesController < ApplicationController

	def index
		@interfaces = Interface.all
		render 'index'
	end

	def show
	end
	def new
	end

	def create
		@interface = Interface.new(interface_params)
		if @interface.save
			if request.xhr?
				json: @interface
				erb: '/index'	
			else
				redirect_to root_path
				flash[:error] = "NO AJAX!"
			end
		else
			flash[:error] = "Nopee"
			render '/new'
		end
	end

	def destroy
		@interface = Interface.find(params[:id])
		@interface.destroy
		if request.xhr?
			"AJax"
		else
			redirect_to root_path
			render: @interface
		end

	end


  private
    def interface_params
      params.require(:interface).permit(:ip, :hostname, :port, :ddns, :notes)
    end


end

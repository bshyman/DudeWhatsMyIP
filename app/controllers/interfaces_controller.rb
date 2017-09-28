class InterfacesController < ApplicationController


	def index
		@interfaces = Interface.all
		# respond_to :html, :json
		render 'index'
	end

	def show
	end
	def new
	end

	def create
		@interface = Interface.new(interface_params)
		if @interface.save
			redirect_to root_path
		else
			flash[:error] = "Nopee"
			render '/new'
		end
	end

	def destroy
		@interface = Interface.find(params[:id])
		@interface.destroy
		redirect_to root_path
	end


  private
    def interface_params
      params.require(:interface).permit(:ip, :hostname, :port, :ddns, :notes)
    end


end

class InterfacesController < ApplicationController
	respond_to :html, :js

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
				render json: @interface
			else
				p "UGHHH"
				# redirect_to root_path 
			end
		else
			p "DATABASE ENTRY ERRROR"
		end
		# p params
		# @interface = Interface.new(interface_params)
		# if @interface.save
		#   respond_to do |format|
		#     format.html { redirect_to interfaces_path, notice: "Saved" }
		#     format.json { render json: @interface, location: interface_path(@interface), status: :created }
		#   end
		# else
		#   respond_to do |format|
		#     format.html { render :edit }
		#     format.json {render json: @interface, status: :unprocessable_entity }
		#   end
		# end
	end

	def destroy
		@interface = Interface.find(params[:id])
		if request.xhr?
			@interface.to_json
			@interface.destroy
			# respond_to do |format|
	  #     format.html { redirect_to interfaces_url }
	  #     format.json { head :no_content }
	  #     format.js   { render :layout => false }
	  #   end
		else
			p "IN ELLLLLLLSE"
		end

	end

  private
    def interface_params
      params.require(:interface).permit(:id, :ip, :hostname, :port, :ddns, :notes)
    end


end

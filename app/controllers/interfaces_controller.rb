class InterfacesController < ApplicationController

	def index
		@interfaces = Interface.all
	end

	def show
	end
	def new
	end

	def create
		@interface = params
	end


end

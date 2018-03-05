class PagesController < ApplicationController
	def visitor
		@interfaces = fake_interfaces
		render 'interfaces/index'
	end
end

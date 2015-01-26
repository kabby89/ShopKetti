class Creator::ManagementController < ApplicationController
	def show
		@products = Product.all
	end

	def index
	end

end

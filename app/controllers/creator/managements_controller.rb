class Creator::ManagementsController < ApplicationController
	def show
		@products = Product.all
	end

	def index
	end

end

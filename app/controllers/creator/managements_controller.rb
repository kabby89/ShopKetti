class Creator::ManagementsController < ApplicationController
	def show
		@products = current_user.products.all
	end

	def index
	end

end

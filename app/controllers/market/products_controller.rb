class Market::ProductsController < ApplicationController
	def index
		@products = Product.all
	end
end

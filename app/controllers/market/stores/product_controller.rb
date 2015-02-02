class Market::Stores::ProductController < ApplicationController
	def show
		@product ||= current_store.current_product
		respond_with(@product)
	end
end

class Market::Stores::ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@order_item = current_order.order_items.new
	end
end

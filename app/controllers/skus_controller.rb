class SkuDatabasesController < ApplicationController
	def edit
	end

	def index
		@skus = Sku.all
		@order_item = current_order.order_items.new
	end

end

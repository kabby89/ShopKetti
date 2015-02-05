class SkuDatabasesController < ApplicationController
	def create
		@sku = products.sku.create(sku_params)
	end

	def edit
	end

	def index
		@skus = Sku.all
		@order_item = current_order.order_items.new
	end

	private
	def sku_params
		params.require(:sku).permit(:price_per_unit, :date_available)
	end
end

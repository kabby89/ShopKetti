class SkuDatabasesController < ApplicationController
	# this needs to aggregate the product, color and size id and attach them to a sku_id

	# def create
	#	@sku = Sku_database.create(sku_params)
	# end

	private
	# def sku_params
	#	params.require(:sku_database).permit(:product_id, :size_id, :color_id, :inventory, :price_per_unit, :date_available)
	# end
end

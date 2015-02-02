class ColorsController < ApplicationController
	def create
		@color = products.color.create(color_params)
	end

	private

	def color_params
		params.require(:color).permit(:hue, :product_id)
	end
end

class SizesController < ApplicationController

	def create
		@size = products.Size.create(size_params)
	end

	private
	def size_params
		params.require(:size).permit(:measurements, :product_id)
	end
end

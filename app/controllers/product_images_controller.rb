class ProductImagesController < ApplicationController
	def create
		@image = products.product_images.create(image_params)
	end

	private


	def image_params
		params.require(:product_image).permit(:image, :product_id, :user_id)
	end
end

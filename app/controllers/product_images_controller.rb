class ProductImagesController < ApplicationController
	def create
		@image = products.product_images.create(image_params)
	end

	private
	# helper_method :current_color
	# def current_color
	#	@current_color = Color.find(params[:id])
	# end

	def image_params
		params.require(:product_image).permit(:image, :product_id, :user_id)
	end
end

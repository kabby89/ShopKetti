class ColorsController < ApplicationController
	# this needs to create the colors and pass them into the sku controller
	# def create
	#	@color = products.color.create(color_params)
	# end

	private
	# helper_method :current_color
	# def current_color
	#	@current_color = Color.find(params[:id])
	# end

	def color_params
		params.require(:color).permit(:hue, :product_id)
	end
end

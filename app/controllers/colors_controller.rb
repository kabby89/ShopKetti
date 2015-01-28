class ColorsController < ApplicationController
	def create
		@color = products.color.create(color_params)
	end

	private
	# helper_method :current_color
	# def current_color
	#	@current_color = Color.find(params[:id])
	# end

	def color_params
		params.require(:color).permit(:hue, :product_id)
	end
end

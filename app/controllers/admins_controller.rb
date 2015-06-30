class AdminsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_only
	helper_method :admin_only

	def index
		@creators = User.all
		@product = Product.create
	end

	private

	def admin_only
		if !current_user.user_type = "admin"
			redirect_to root
		else
		end	
	end

	#def product_params
	# params.require(:product).permit(:name, :description, :price, :active, :style_number, :date_available, :shipping_cost, :sku, colors_attributes: [:id, :hue, :done, :_destroy], sizes_attributes: [:id, :measurement, :done, :_destroy], product_images_attributes: [:id, :image, :featured, :done, :_destroy], sku_attributes: [:id, :price_per_unit, :date_available, :done, :_destroy])
	#end
end

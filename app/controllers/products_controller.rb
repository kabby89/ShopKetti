class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
	end

	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.create(product_params)
		redirect_to root_path
	end

	private
	def product_params
		params.require(:product).permit(:name, :description, :style_number, :color, :size, :inventory, :date_available, :price, :shipping_cost)
	end
end

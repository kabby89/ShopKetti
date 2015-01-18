class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	# this needs to create the product and pass the product id to the sku controller

	def index
	end

	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.create(product_params)
	end

	private

	# helper_method :current_product
	# def current_product
	#	@current_product = Product.find(params[:product_id])
	# end

	def product_params
		params.require(:product).permit(:name, :description, :style_number, :color, :date_available, :shipping_cost, :sku_database, task_attributes: [:id, :description, :color, :done, :_destory])
	end
end

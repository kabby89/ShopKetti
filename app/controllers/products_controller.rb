class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	before_action :current_product, only: [:show, :edit, :update, :destroy]

	respond_to :html
	def index
		@product = Product.all
	end

	def new
		@product = Product.new
		respond_with(@product)
	end

	def create
		@product = Product.new(product_params)
		@product.save
		respond_with(@product)
	end

	def show
		@product = current_product
		respond_with(@product)
	end

	private

	helper_method :current_product
	def current_product
		@current_product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :style_number, :date_available, :shipping_cost, :sku_database, color_attributes: [:id, :hue, :done, :_destroy], size_attributes: [:id, :measurement, :done, :_destroy])
	end
end

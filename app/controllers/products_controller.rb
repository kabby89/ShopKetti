class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	before_action :current_product, only: [:show, :edit, :update, :destroy]

	respond_to :html
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		respond_with(@product)
	end

	def create
		@product = current_user.products.create(product_params)
		respond_with(@product)
	end

	def show
		@product = current_product
		respond_with(@product)
	end

	def edit
		@product = current_product
	end

	def update
    @product.update(product_params)
    respond_with(@product)
  end

	private

	helper_method :current_product
	def current_product
		@current_product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :price, :style_number, :date_available, :image, :shipping_cost, :sku, colors_attributes: [:id, :hue, :done, :_destroy], sizes_attributes: [:id, :measurement, :done, :_destroy], product_images_attributes: [:id, :image, :done, :_destroy], sku_attributes: [:id, :price_per_unit, :date_available, :done, :_destroy])
	end
end

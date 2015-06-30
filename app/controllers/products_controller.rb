class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	before_action :current_product, only: [:show, :edit, :update, :destroy]
	helper_method :current_product
	helper_method :admin_create_product
	
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

		if @product.invalid?
			flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
		end
		
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
		@product = current_product
    	@product.update_attributes(product_params)
    	respond_with(@product)
  	end

	private

	def admin_create_product
		@product.create(product_params)
		@product.user = @creator
	end

	def current_product
		@current_product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :price, :user_id, :creator_id, :active, :style_number, :date_available, :shipping_cost, :sku, colors_attributes: [:id, :hue, :done, :_destroy], sizes_attributes: [:id, :measurement, :done, :_destroy], product_images_attributes: [:id, :image, :featured, :done, :_destroy], sku_attributes: [:id, :price_per_unit, :date_available, :done, :_destroy])
	end
end

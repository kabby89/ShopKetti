class Creator::Management::OrdersController < ApplicationController
	before_action :authenticate_user!
	def show
		@orders = ::Order.all
	end

	def index
		@orders = ::Order.all
	end

	def new
		@order = ::Order.find(params[:id])
	end

	def edit
		@order = ::Order.find(params[:id])
	end

	def create
		@order = edit_current_order.create(order_params)
	end

	def update
		@order = ::Order.find(params[:id])
		@order.update_attributes(order_params)
		redirect_to creator_management_orders_path
	end

	def edit_current_order
		edit_current_order = @order
	end

	private
	def order_params
		params.permit(:order_shipped, :order_sh_date, :ship_type, :tracking, :eta, :returned, :return_date)
	end
end

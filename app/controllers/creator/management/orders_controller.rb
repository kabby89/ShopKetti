class Creator::Management::OrdersController < ApplicationController
	before_action :authenticate_user!
	def show
		@orders = ::Order.all
	end

	def index
		@orders = ::Order.all
	end

	def edit
		@order = ::Order.find(params[:id])
		@orders = edit_current_order.update(order_params)
	end

	def update
		
	end

	private
	def order_params
		params.permit(:order_shipped, :order_sh_date, :ship_type, :tracking, :eta, :returned, :return_date)
	end

	def edit_current_order
		edit_current_order = @order
	end
end

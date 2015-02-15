class Creator::Management::OrdersController < ApplicationController
	before_action :authenticate_user!
	def show
		@orders = current_user.orders
		# need to add User to orders table so we can call orders by user
		# @order_status = current_user.orders.orderstatuss
	end
end

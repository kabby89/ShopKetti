class Creator::Management::MyReturnsController < ApplicationController
	def index
		@orders = current_user.orders.all
		@order_items = @orders.order_items.all
	end

	def show
		@order = Order.find(params[:id])
		@order_item = @order.order_items.find(params[:id])
	end

	def create
		@order = Order.find(params[:id])
		@order_item = @order.order_items.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
	end

	def destroy
	end

	private
	def order_item_params
		params.require(:order).permit(:id, order_items: [:quantity, :sku_id, :price_per_unit], orders: [:order_status_id, :shipping])
	end
end

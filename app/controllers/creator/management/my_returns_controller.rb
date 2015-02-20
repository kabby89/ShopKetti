class Creator::Management::MyReturnsController < ApplicationController
	def index
		@order = current_order
	end

	def show
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
		params.require(:order).permit(:id, :order_id)
	end
end

class OrderItemsController < ApplicationController
  before_filter :authenticate_user!
  def create
    # @user = current_user
    @order = current_order
    @order.user = current_user
    @order.creator_id = @order.order_items.first.sku.product.user.id
    @order.save
    session[:order_id] = @order.id
    order_item_params[:order_items].each do |oi|
      current_order.order_items.create(oi)
    end
    redirect_to cart_path(@order)
  end

  def update
    @order = current_order
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.update_attributes(order_item_params)
  	@order_items = @order.order_items
  end

  def destroy
  	@order = current_order
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.destroy
  	@order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:cart).permit(:id, :user_id, :creator_id, order_items: [:quantity, :sku_id])
  end

end

class CartsController < ApplicationController
  before_filter :authenticate_user!
  def show
  	@order_items = current_order.order_items
  	@user = current_user
    @is_admin = current_user && current_user.id == @user.id
  end

   def buy
    @order = current_order
    @order_items = current_order.order_items
      redirect_uri = url_for(:controller => 'carts', :action => 'payment_success', :user_id => params[:user_id], :host => request.host_with_port)
      @user = current_order.order_items.first.sku.product.user
      begin
        @checkout = @user.create_checkout(current_order, redirect_uri)
      end
   end

   def payment_success
      @order = current_order
      @order.creator_id = @order.order_items.first.sku.product.user.id
      @order.save
      @user = current_user
      if !params[:checkout_id]
        return redirect_to @user, alert: "Error - Checkout ID is expected"
      end
      if (params['error'] && params['error_description'])
        return redirect_to @user, alert: "Error - #{params['error_description']}"
      end
      redirect_to root_url, notice: "Thanks for the payment! You should receive a confirmation email shortly."
      clear_current_order
	end
end

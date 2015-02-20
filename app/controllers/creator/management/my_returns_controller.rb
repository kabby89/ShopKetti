class Creator::Management::MyReturnsController < ApplicationController
	def index
		@order = current_order
	end

	def create
		@exchange = current_order.my_returns.create(exchange_params) 
	end

	def oauth
  		if !params[:code]
    		return redirect_to(creator_management_order_path)
  		end
      @user = current_order.user
      redirect_uri = url_for(:controller => '/my_returns', :action => 'oauth', :user_id => @user.id, :host => request.host_with_port)
    	@user.request_wepay_access_token(params[:code], redirect_uri)
   	redirect_to root_url, notice: 'We successfully connected you to WePay!'
  end

  def exchange
  	redirect_uri = url_for(:controller => 'my_returns', :action => 'return_success', :user_id => params[:user_id], :host => request.host_with_port)
 	@user = current_order.user
   begin
      @refund = @user.create_refund(current_order, redirect_uri)
   end
  end

	private
	def order_item_params
		params.require(:order).permit(:id, :order_id)
	end

	def exchange_params
		params.require(:order).permit(:id, :amount, :notes)
	end
end

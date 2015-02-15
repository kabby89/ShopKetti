class CartsController < ApplicationController
  def show
  	@order_items = current_order.order_items
  	@user = current_user
    @is_admin = current_user && current_user.id == @user.id
  end
	
	# GET /users/oauth/1
	def oauth
  		if !params[:code]
    		return redirect_to('/')
  		end
      @user = User.find(params[:user_id])
      redirect_uri = url_for(:controller => '/carts', :action => 'oauth', :user_id => @user.id, :host => request.host_with_port)
  		# begin
    		@user.request_wepay_access_token(params[:code], redirect_uri)
  		# rescue Exception => e
  		#	error = e.message
 			# end

	  	# if error
  		#	redirect_to @user, alert: error
  		# else	
   		redirect_to root_url, notice: 'We successfully connected you to WePay!'
  		# end
   end

   # GET /users/buy/1
   def buy
      redirect_uri = url_for(:controller => 'carts', :action => 'payment_success', :user_id => params[:user_id], :host => request.host_with_port)
      # this should be the seller user not current user
      @user = current_order.order_items.first.sku.product.user
      begin
        @checkout = @user.create_checkout(current_order, redirect_uri)
      end
   end

   # GET /users/payment_success/1
   def payment_success
      @user = User.find(params[:user_id])
      if !params[:checkout_id]
        return redirect_to @user, alert: "Error - Checkout ID is expected"
      end
      if (params['error'] && params['error_description'])
        return redirect_to @user, alert: "Error - #{params['error_description']}"
      end
      redirect_to root_url, notice: "<br /><br /><br />Thanks for the payment! You should receive a confirmation email shortly."
	end
end

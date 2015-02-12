class Carts::CheckoutsController < ApplicationController
	def index
		# GET /farmers/oauth/1
		def oauth
  			if !params[:code]
    			return redirect_to('/')
  			end

  			redirect_uri = url_for(:controller => 'checkouts', :action => 'oauth', :user_id => params[:user_id], :host => request.host_with_port)
  				@user = User.find(params[:user_id])
  			begin
    			@user.request_wepay_access_token(params[:code], redirect_uri)
  			rescue Exception => e
    			error = e.message
  			end

		  	if error
    			redirect_to @user, alert: error
  			else	
    		redirect_to @user, notice: 'We successfully connected you to WePay!'
  			end
		end
	end
end

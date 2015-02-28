class WepaysController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	# GET /users/oauth/1
	def oauth
  		if !params[:code]
    		return redirect_to('/')
  		end
      @user = User.find(params[:user_id])
      redirect_uri = url_for(:controller => '/wepays', :action => 'oauth', :user_id => params[:user_id], :host => request.host_with_port)
  		begin
    		@user.request_wepay_access_token(params[:code], redirect_uri)
  		rescue Exception => e
  			error = e.message
 		end
	  	if error
  			redirect_to @user, alert: error
  		else	
   		redirect_to root_url, notice: 'We successfully connected you to WePay!'
  		end
  	end
end

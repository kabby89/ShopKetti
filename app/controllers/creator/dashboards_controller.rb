class Creator::DashboardsController < ApplicationController
	before_action :authenticate_user!
	before_action :creators_authenticated
	before_action :wepay_authenticated
	def index
	end
	
	protected
	def wepay_authenticated
		if current_user.wepay_access_token.nil? 
			redirect_to wepays_path
		else
		end
	end

	def creators_authenticated
		if current_user.user_type != 'creator'
			redirect_to retailer_dashboards_path
		else
		end
	end
end

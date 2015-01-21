class StaticHomePageController < ApplicationController
	def index
		if user_signed_in? != true
			root_url
		elsif current_user.user_type == 'retailer'
			redirect_to market_stores_path
		else 
			redirect_to creator_dashboards_path	
		end
	end
end

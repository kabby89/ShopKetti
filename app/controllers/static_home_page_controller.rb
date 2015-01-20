class StaticHomePageController < ApplicationController
	def index
		if current_user.user_type == 'retailer'
			redirect_to root_path
		elsif current_user.user_type == 'creator'
			redirect_to creator_dashboards_path
		else
		 	redirect_to root_path
		end
	end
end

class AdminsController < ApplicationController
	#before_action :authenticate_user!
	#helper_method :admin_only

	def index
		@creators = User.all
		@product = Product.create
	end

	private

	def admin_only
		if !current_user.user_type = "admin"
			redirect_to root
		else
		end	
	end
end

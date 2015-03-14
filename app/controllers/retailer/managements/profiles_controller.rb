class Retailer::Managements::ProfilesController < ApplicationController
	def index
		@user = current_user
	end
end

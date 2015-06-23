class Market::StoresController < ApplicationController
	before_action  :authenticate_user!
	helper_method :current_store

	def index
		@users = User.all
	end

	def show
		@products = current_store.products.all
		#if current_user.user_type != "retailer" && current_store != current_user
		#	redirect_to root_path, :alert => 'Sorry, you are not allowed access to that store', :class => 'alert-heading'
		#end
	end

	private
	def current_store
		@current_store ||= User.find(params[:id])
	end
end

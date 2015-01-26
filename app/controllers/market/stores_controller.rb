class Market::StoresController < ApplicationController
	before_action  :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@products = current_store.products.all
	end

	private
	helper_method :current_store
	def current_store
		@current_store ||= User.find(params[:id])
	end
end

class Market::StoresController < ApplicationController
	before_action  :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@store = User.find(params[:id])
	end
end

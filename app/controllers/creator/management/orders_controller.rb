class Creator::Management::OrdersController < ApplicationController
	before_action :authenticate_user!
	def show
		@orders = ::Order.all
	end

	def index
		@orders = ::Order.all
	end
end

class Retailer::Managements::OrdersController < ApplicationController
	def index
		@orders = ::Order.all
	end
end

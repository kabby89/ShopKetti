class OrderStatus < ActiveRecord::Base
	has_many :orders

	def self.find_or_create_by_or_name(name)
		orderstatus = OrderStatus.where(:name => name)
		if orderstatus.blank?
			orderstatus = OrderStatus.create(:name => name)
		end

		orderstatus
	end

	ORDERSATUSES = ['Order Placed', 'Order Shipped', 'Order Received']

	class << self
		ORDERSATUSES.each do |status|
			define_method status.downcase.gsub(" ", "_").gsub("-", "_") do
				OrderStatus.where(:status => orderstatus).first
			end
		end
	end

	def status_path
		if self.name == "Order Placed"
			:order_placed_path
		elsif self.name == "Order Shipped"
			:order_shipped_path
		elsif self.name == "Order Received"
			:order_received_path
		else
			nil
		end		
	end
end

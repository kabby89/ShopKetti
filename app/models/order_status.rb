class OrderStatus < ActiveRecord::Base
	has_and_belongs_to_many :orders

	def self.find_or_create_by_or_name(name)
		orderstatus = OrderStatus.where(:name => name)
		if orderstatus.blank?
			orderstatus = OrderStatus.create(:name => name)
		end

		orderstatus
	end

	ORDERSATUSES = ['Order Placed', 'Order Shipped', 'Order Received', 'Order Partially Returned', 'Order Fully Returned']

	class << self
		ORDERSATUSES.each do |status|
			define_method status.to_s.downcase.gsub(" ", "_").gsub("-", "_") do
				OrderStatus.where(:name => status).first
			end
		end
	end
end

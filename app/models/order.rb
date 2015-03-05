class Order < ActiveRecord::Base
	has_and_belongs_to_many :order_status
	has_many :order_items, autosave: true
	before_save :set_order_status
	before_save :update_subtotal
	belongs_to :user

	def subtotal
		order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price_per_unit) : 0}.sum
	end

	def total
		return subtotal
	end

	private
	
	def set_order_status
		self.order_status_id = OrderStatus.name
	end

	def update_subtotal
		self[:subtotal] = subtotal
	end

end

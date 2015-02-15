class Order < ActiveRecord::Base
	belongs_to :order_status
	has_many :order_items, autosave: true
	before_create :set_order_status
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
		# self.order_status.find_or_create_by_name('Order Placed')
	end

	def update_subtotal
		self[:subtotal] = subtotal
	end

end

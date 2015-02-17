class OrderItem < ActiveRecord::Base
	belongs_to :sku
	belongs_to :order

	validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0 }
	validate :sku_present
	validate :order_present

	before_save :finalize

	def product
		sku.product
	end

	def unit_price
		if persisted?
			self[:price]
		else
			product.price
		end
	end

	def total_price
		sku.product.price * quantity
	end

	private
	def sku_present
		if sku.nil?
			errors.add(:sku, "is not valid or active at this time.")
		end
	end


	def order_present
		if order.nil?
			errors.add(:order, "is not a valid order.")
		end
	end

	def finalize
		self[:price_per_unit] = product.price
		self[:total_price] = quantity * self[:price_per_unit]
	end


end

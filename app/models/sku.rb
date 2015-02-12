class Sku < ActiveRecord::Base
	belongs_to :product
	belongs_to :color
	belongs_to :size
	has_many :order_items
	default_scope { where(active: true) }


end

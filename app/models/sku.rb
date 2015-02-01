class Sku < ActiveRecord::Base
	belongs_to :product
	has_many :colors, through: :products
	has_many :sizes, through: :products
	has_many :order_items
	default_scope { where (active: true)}
end

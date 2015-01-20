class Sku < ActiveRecord::Base
	belongs_to :produt
	has_many :colors, through: :products
	has_many :sizes, through: :products
end

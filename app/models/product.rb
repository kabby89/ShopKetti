class Product < ActiveRecord::Base
	belongs_to :user
	has_many :sku_databases
	has_many :colors
	has_many :sizes
	accepts_nested_attributes_for :colors
	accepts_nested_attributes_for :sizes
end

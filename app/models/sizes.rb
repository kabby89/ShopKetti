class Sizes < ActiveRecord::Base
	belongs_to :product
	belongs_to :sku_database
end

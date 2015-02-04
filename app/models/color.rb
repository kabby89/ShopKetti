class Color < ActiveRecord::Base
	belongs_to :product
	belongs_to :sku

end

class Color < ActiveRecord::Base
	belongs_to :product
	has_many :skus

end

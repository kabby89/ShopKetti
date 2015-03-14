class Color < ActiveRecord::Base
	belongs_to :product
	has_many :skus
	validates :hue, :presence => true

end

class Size < ActiveRecord::Base
	belongs_to :product
	has_many :skus
	validates :measurement, :presence => true
end

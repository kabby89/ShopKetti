class Product < ActiveRecord::Base
	belongs_to :user
	has_many :colors
	has_many :sizes
	has_many :skus
	has_many :product_images
	accepts_nested_attributes_for :colors, :reject_if => :all_blank, :allow_destroy => :true
	accepts_nested_attributes_for :sizes, :allow_destroy => :true
	accepts_nested_attributes_for :product_images, :reject_if => :all_blank ,:allow_destroy => :true
	before_create :generate_skus!

	def generate_skus!
		colors.each do |color|
			sizes.each do |size|
				self.skus.build(:color_id => color.id, :size_id => size.id)
			end
		end
	end
end

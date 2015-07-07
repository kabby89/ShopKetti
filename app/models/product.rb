class Product < ActiveRecord::Base
	belongs_to :user
	has_many :colors
	has_many :sizes
	has_many :skus
	has_many :product_images
	accepts_nested_attributes_for :colors, :reject_if => :all_blank, :allow_destroy => :true
	accepts_nested_attributes_for :sizes, :allow_destroy => :true
	accepts_nested_attributes_for :product_images, :reject_if => :all_blank ,:allow_destroy => :true
	accepts_nested_attributes_for :skus
	after_create :generate_skus!
	#validates :name, :presence => true
	#validates :description, :presence => true
	#validates :style_number, :presence => true
	#validates :shipping_cost, :presence => true
	#validates :price, :presence => true

	def generate_skus!
		colors.each do |color|
			sizes.each do |size|
				self.skus.build(:color => color, :size => size)
			end
		end
	end

	def first_product
		@product = Product.find(params[:id])
		@product.product_images.images.each do |picture|
			if picture.order == 1
				@first_product = picture
			end
		end
	end
end

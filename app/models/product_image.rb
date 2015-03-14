class ProductImage < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :product
	validates :image, :presence => true
end

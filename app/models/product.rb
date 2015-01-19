class Product < ActiveRecord::Base
	belongs_to :user
	has_many :colors
	has_many :sizes
	accepts_nested_attributes_for :colors, :reject_if => :all_blank, :allow_destroy => :true
	accepts_nested_attributes_for :sizes, :allow_destroy => :true
end

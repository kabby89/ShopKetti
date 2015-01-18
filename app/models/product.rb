class Product < ActiveRecord::Base
	belongs_to :user
	has_many :colors
	accepts_nested_attributes_for :colors, :reject_if => :all_blank, :allow_destroy => :true

end

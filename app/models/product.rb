class Product < ActiveRecord::Base
	belongs_to :user
	accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
	has_many :sku_databases
	has_many :colors
	has_many :sizes
end

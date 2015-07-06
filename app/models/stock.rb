class Stock < ActiveRecord::Base
  attr_accessible :category_id, :name, :website
  belongs_to :category
  default_scope :order => 'name ASC'
  
end

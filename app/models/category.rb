class Category < ActiveRecord::Base
  # attr_accessible :name, :sequence
  default_scope {order('sequence ASC') }
  
end

class Role < ActiveRecord::Base
  # attr_accessible :name, :authorizable_type, :authorizable_id
  has_many :users
   
end

class Organization < ActiveRecord::Base
  # attr_accessible :title
  has_many :category_types
end

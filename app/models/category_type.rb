class CategoryType < ActiveRecord::Base
  # attr_accessible :title, :organization_id, :sort_order
  belongs_to :organization
  has_many :category_titles
  has_many :categories
  def gather(e)
  @r = CategoryTitle.where(["category_type_id = ?", e.id])

  return @r
end


end

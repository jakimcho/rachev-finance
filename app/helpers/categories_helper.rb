module CategoriesHelper
  def has_sub_categories? cat
    !cat.sub_categories.empty?
  end
  
  def has_parent_category? cat
    !cat.parent_category.nil?
  end
  
  def all_parent_categories
    Category.where "category_id is null"
  end
end

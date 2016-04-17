class Category < ActiveRecord::Base
  has_many :sub_categories, class: Category, foreign_key: :category_id
  belongs_to :parent_category, class: Category, foreign_key: :category_id
end

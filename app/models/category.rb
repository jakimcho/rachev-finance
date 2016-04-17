class Category < ActiveRecord::Base
  has_many :sub_categories, class: Category, foreign_key: :category_id
  belongs_to :parent_category, class: Category, foreign_key: :category_id
  
  has_attached_file :icon, styles: { medium: "100x100>", thumb: "50x50>" }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  
  validates :description, presence: true
end

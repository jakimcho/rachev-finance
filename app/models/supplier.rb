class Supplier < ActiveRecord::Base
  has_and_belongs_to_many :categories
  
  validates :name, presence: true
end

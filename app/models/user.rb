# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  password   :string(255)      not null
#  family_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#

class User < ActiveRecord::Base
  belongs_to :family

  validates :name, :password, :family_id, :email, presence: true
  validate  :email, uniqueness: true
  validates :password, :presence => true, :confirmation => true
end

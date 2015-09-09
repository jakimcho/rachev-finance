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
  has_many :accounts
 
  validates :name, :password_digest, :family_id, :email, presence: true
  validate  :email, uniqueness: true
  
  has_secure_password # adds password security :
#The ability to save a securely hashed password_digest attribute to the database
#A pair of virtual attributes18 (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match
#An authenticate method that returns the user when the password is correct (and false otherwise)
  validates :password, presence: true, length: { minimum: 4 }
  validates :password, :confirmation => true
end

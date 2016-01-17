# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  income       :decimal
#  account_id   :integer
#  user         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Income < ActiveRecord::Base
  belongs_to :account # Will create FK account_id
  # has_one :user Will Create FK income_id in User model
  
end

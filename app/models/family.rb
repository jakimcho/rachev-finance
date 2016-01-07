# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  pass       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Family < ActiveRecord::Base
	has_many :users
end

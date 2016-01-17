#
# Table name: Expenses
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  amount       :decimal
#  account_id   :integer
#  user_id      :integer
#  date         :date
#  created_at   :datetime
#  updated_at   :datetime
#


class Expense < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  
  validates :description, :user_id, :account_id, :amount, :date, presence: true
  validates :amount, numericality: true
end

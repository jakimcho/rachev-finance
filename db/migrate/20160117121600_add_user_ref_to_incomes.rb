# Generated through:
# rails generate migration AddUserRefToIncomes user:references
class AddUserRefToIncomes < ActiveRecord::Migration
  def change
    add_reference :incomes, :user, index: true, foreign_key: true
  end
end

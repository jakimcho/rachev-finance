class AddTitleAndDateToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :title, :string
    add_column :incomes, :date, :date
  end
end

class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :description
      t.decimal :income
      t.references :account, index: true
      t.timestamps
    end
  end
end

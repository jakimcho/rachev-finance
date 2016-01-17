class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.references :account, index: true
      t.references :user, index: true
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end

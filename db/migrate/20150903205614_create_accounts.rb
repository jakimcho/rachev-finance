class CreateAccounts < ActiveRecord::Migration
  def change
  	drop_table(:accounts, if_exists: true)
  	
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance
      t.references :user, index: true
      t.string :icon

      t.timestamps
    end
  end
end

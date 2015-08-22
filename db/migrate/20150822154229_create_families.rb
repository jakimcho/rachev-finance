class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, :null => false
      t.string :pass, :null => false

      t.timestamps
    end
  end
end

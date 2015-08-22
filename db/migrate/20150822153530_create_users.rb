class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :password, :null => false
      t.references :family, index: true, :null => false

      t.timestamps
    end
  end
end

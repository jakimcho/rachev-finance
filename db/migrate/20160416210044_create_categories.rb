class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description
      t.string :summary
      t.belongs_to :category

      t.timestamps
    end
  end
end

class CreateCategoriesSuppliers < ActiveRecord::Migration
  def change
    create_table :categories_suppliers, id: false do |t|
      t.integer :category_id
      t.integer :supplier_id
    end
  end
end

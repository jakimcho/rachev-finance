class AddAttachmentIconToSuppliers < ActiveRecord::Migration
  def self.up
    change_table :suppliers do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :suppliers, :icon
  end
end

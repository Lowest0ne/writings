class CreateEntryCategories < ActiveRecord::Migration
  def change
    create_table :entry_categories do |t|
      t.integer :entry_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end

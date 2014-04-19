class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :contents, null: false
      t.string :title, null: false, default: 'Untitled'
      t.date :date

      t.timestamps
    end
  end
end

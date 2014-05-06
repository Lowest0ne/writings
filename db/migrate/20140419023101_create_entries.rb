class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :contents, null: false
      t.string :title, null: false, default: 'Untitled'
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end
  end
end

class AddBookIdtoEntries < ActiveRecord::Migration
  def change
    add_column :entries, :book_id, :integer, null: false
  end
end

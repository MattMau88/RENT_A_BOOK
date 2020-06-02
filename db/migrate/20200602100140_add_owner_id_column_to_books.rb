class AddOwnerIdColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :books, :owner_id, index: true
    add_reference :books, :owner, null: false, foreign_key: { to_table: :users }
  end
end

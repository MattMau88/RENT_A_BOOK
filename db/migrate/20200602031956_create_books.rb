class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :category
      t.integer :rental_fee_per_day
      # following line updated before running migraion:
      t.references :owner_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

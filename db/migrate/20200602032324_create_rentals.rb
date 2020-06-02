class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.string :pickup_location
      t.datetime :pickup_date
      t.datetime :return_date
      t.references :book, null: false, foreign_key: true
      # following line updated before running migraion:
      t.references :rentee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

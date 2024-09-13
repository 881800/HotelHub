class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :room_type
      t.boolean :availability
      t.decimal :price
      t.text :description
      t.decimal :price_per_night
      t.integer :beds
      t.date :available_from
      t.date :available_to
      t.integer :guests

      t.timestamps
    end
  end
end

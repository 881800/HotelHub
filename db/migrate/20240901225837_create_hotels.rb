class CreateHotels < ActiveRecord::Migration[7.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :room_count
      t.text :amenities
      t.decimal :price_per_night

      t.timestamps
    end
  end
end

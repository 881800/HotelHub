class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :room_type
      t.boolean :availability
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end

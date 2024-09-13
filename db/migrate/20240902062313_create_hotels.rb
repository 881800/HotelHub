class CreateHotels < ActiveRecord::Migration[7.2]
  def change
    add_column :hotels, :average_rating, :decimal, precision: 3, scale: 2
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end

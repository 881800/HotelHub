class CreateOpinions < ActiveRecord::Migration[7.2]
  def change
    create_table :opinions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end

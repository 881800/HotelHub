class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :role
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps
    end

    # Añadimos índices para Devise
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

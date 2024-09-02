class ModifyReservations < ActiveRecord::Migration[7.2]
  def change

    add_reference :reservations, :payments, foreign_key: true
    
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Room.create(
  hotel_id: 8,   # Asegúrate de usar esta variable
  room_type: "Suite",
  availability: true,
  price: 120.50,
  description: "Una suite de lujo con vista al mar, cama king-size y todas las comodidades."
)



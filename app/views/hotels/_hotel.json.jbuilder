json.extract! hotel, :id, :name, :location, :description, :room_count, :amenities, :price_per_night, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)

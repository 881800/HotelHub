json.extract! room, :id, :hotel_id, :room_type, :availability, :price, :description, :created_at, :updated_at
json.url room_url(room, format: :json)

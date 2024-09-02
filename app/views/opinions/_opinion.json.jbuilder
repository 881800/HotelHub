json.extract! opinion, :id, :user_id, :hotel_id, :room_id, :rating, :comment, :created_at, :updated_at
json.url opinion_url(opinion, format: :json)

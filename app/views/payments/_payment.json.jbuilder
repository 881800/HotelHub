json.extract! payment, :id, :reservation_id, :method, :status, :created_at, :updated_at
json.url payment_url(payment, format: :json)

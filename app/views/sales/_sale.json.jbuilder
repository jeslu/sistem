json.extract! sale, :id, :user_id, :client_id, :fecha, :total, :active, :created_at, :updated_at
json.url sale_url(sale, format: :json)

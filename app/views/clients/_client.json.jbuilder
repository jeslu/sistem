json.extract! client, :id, :name, :apellido, :cel, :direccion, :active, :created_at, :updated_at
json.url client_url(client, format: :json)

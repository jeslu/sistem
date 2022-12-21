json.extract! servicio, :id, :name_serv, :description, :costo_serv, :active, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)

json.extract! saledetail, :id, :sale_id, :product_id, :cantidad, :importe, :active, :created_at, :updated_at
json.url saledetail_url(saledetail, format: :json)

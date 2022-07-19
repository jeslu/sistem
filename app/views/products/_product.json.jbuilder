json.extract! product, :id, :name_p, :description, :category_id, :mark_id, :extent_id, :code, :stok, :precio, :active, :created_at, :updated_at
json.url product_url(product, format: :json)

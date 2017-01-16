json.extract! product, :id, :name, :desc, :price, :image, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
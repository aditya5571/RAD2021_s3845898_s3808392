json.extract! product, :id, :company, :title, :size, :price, :imageString, :created_at, :updated_at
json.url product_url(product, format: :json)

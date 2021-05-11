json.extract! item, :id, :title, :price, :image, :category, :created_at, :updated_at
json.url item_url(item, format: :json)

json.extract! item, :id, :title, :price, :image, :category, :popularity, :date_stocked, :created_at, :updated_at
json.url item_url(item, format: :json)

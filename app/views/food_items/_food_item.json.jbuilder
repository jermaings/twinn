json.extract! food_item, :id, :name, :price, :comments, :created_at, :updated_at, :category, :size
json.url food_item_url(food_item, format: :json)

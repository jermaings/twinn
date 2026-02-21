json.extract! food_type, :id, :category, :name, :price, :image, :size, :foods_id, :created_at, :updated_at
json.url food_type_url(food_type, format: :json)

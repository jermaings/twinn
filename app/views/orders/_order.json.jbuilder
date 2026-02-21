json.extract! order, :id, :name, :price, :tax, :total, :orderNumber, :created_at, :updated_at
json.url order_url(order, format: :json)

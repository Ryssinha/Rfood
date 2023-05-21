json.extract! dish, :id, :chef_id, :name, :description, :available, :active, :unit_price, :created_at, :updated_at
json.url dish_url(dish, format: :json)

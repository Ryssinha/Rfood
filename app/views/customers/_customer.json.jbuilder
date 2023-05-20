json.extract! customer, :id, :user_id, :birthday, :created_at, :updated_at
json.url customer_url(customer, format: :json)

json.extract! order, :id, :customer_id, :delivery_address_id, :total_price, :status, :freight_price, :coupon_id, :created_at, :updated_at
json.url order_url(order, format: :json)

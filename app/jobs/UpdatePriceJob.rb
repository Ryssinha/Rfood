# app/jobs/update_price_job.rb
class UpdatePriceJob < ApplicationJob
  queue_as :dishes
  sidekiq_options retry: 5

  def perform(dish_id, new_unit_price)
    dish = Dish.find(dish_id)
    dish.update(unit_price: new_unit_price)

    update_order_items(dish)
    update_orders(dish)
  end

  private

  def update_order_items(dish)
    orders = Order.joins(:order_items).where(order_items: { dish_id: dish.id, status: 'started' })

    orders.each do |order|
      order_items = order.order_items.where(dish_id: dish.id)
      order_items.each do |order_item|
        order_item.update(unit_price: dish.unit_price)
      end

      order.update(total_price: order.calculate_total_price)
    end
  end

  def update_orders(dish)
    orders = Order.joins(:order_items).where(order_items: { dish_id: dish.id, status: 'started' })

    orders.each do |order|
      order.update(total_price: order.calculate_total_price)
    end
  end
end

class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
    render json: @order_items
  end

 def show
  if params[:id]
    @order_item = OrderItem.find(params[:id])
  elsif params[:chef_id]
    chef = Chef.find(params[:chef_id])
    @order_item = chef.order_items
  end
  render json: @order_item
end
end

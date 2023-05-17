class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
    render json: @order_items
  end

  def show
    @order_item = OrderItem.find(params[:id])
    render json: @order_item
  end
end

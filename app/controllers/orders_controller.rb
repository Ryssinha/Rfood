class OrdersController < ApplicationController
  def index
    @order = Order.all
    render json: @order
  end

  def show
    @orders = Order.find(params[:id])
    render json: @orders
  end
end

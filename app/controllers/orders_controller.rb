class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @orders = Order.find(params[:id])
    render json: @orders
  end
end

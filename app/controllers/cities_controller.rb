class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities
  end

  def show
    if params[:id]
    @city = City.find(params[:Id])
    elsif params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @city = chef.city
    elsif params[:order_id]
      order = Order.find(params[:order_id])
      @city = order.city
    end
    render json: @city
  end
end

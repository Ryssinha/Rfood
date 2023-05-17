class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities
  end

  def show
    @cities = City.find(params[:id])
    render json: @city
  end
end

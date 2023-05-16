class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
    render json: @chefs
  end

  def show
    @chef = Chef.find(params[:id])
    render json: @chef
  end
end

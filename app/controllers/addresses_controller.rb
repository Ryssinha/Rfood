class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    render json: @addresses
  end

  def show
    if params[:id]
    @address = address.find(params[:Id])
    elsif params[:chef_id]
    chef = Chef.find(params[:chef_id])
    @address = chef.address
    end
    render json: @address
  end
end

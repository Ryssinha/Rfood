class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    render json: @addresses
  end

  def show
    if params[:id]
      @address = Address.find(params[:id])
    elsif params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @address = chef.address
    elsif params[:customer_id]
      customer = Customer.find(params[:customer_id])
      @address = customer.address
    end
    render json: @address
  end
end

class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    if params[:id]
      @customer = customer.find(params[:id])
    elsif params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @customer = chef.customers
    elsif params[:payment_id]
      payment = Payment.find(params[:payment_id])
      @customer = payment.customer
    end
    
    render json: @customer
  end
end

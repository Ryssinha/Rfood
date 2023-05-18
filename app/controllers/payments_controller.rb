class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
    render json: @payments
  end

  def show
    if params[:id]
      @payment = Payment.find(params[:id])
    elsif params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @payment = chef.payments
    elsif params[:order_id]
      order = Order.find(params[:order_id])
      @payment = order.payment
    end
    render json: @payment
  end

end

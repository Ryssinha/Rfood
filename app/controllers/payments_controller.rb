class PaymentsController < ApplicationController
  def index
    @payment = Payment.all
    render json: @payment
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end
end

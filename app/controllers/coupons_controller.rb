class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    render json: @coupons
  end

  def show
    @coupon = Coupon.find(params[:id])
    render json:@ coupon
  end
end

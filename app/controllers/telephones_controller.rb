class TelephonesController < ApplicationController
  def index
    @telephones = Telephone.all
    render json: @telephones
  end

  def show
    @telephone = Telephone.find(params[:id])
    render json: @telephone
  end
end

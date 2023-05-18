class TelephonesController < ApplicationController
  def index
    @telephones = Telephone.all
    render json: @telephones
  end
end

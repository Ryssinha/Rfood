class StatesController < ApplicationController
  def index
    @state = State.all
    render json: @state
  end

  def show
    @state = State.find(params[:id])
    render json: @state
  end
end

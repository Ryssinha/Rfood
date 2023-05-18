class StatesController < ApplicationController
  def index
    @states = State.all
    render json: @states
  end

  def show
    if params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @state = chef.state
    end
    render json: @state
  end
end

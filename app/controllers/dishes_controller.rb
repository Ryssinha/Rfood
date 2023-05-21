class DishesController < ApplicationController
  before_action :set_dish, only: %i[ show edit update destroy ]

  def index
    @dishes = Dish.all
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def edit
  end

  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to dish_url(@dish), notice: "Dish was successfully created." }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to dish_url(@dish), notice: "Dish was successfully updated." }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to dishes_url, notice: "Dish was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_dish
      @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:chef_id, :name, :description, :available, :active, :unit_price)
    end
end

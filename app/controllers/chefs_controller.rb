class ChefsController < ApplicationController
  before_action :set_chef, only: %i[ show edit update destroy ]

  def index
    @chefs = Chef.all
  end

  def show
  end

  def new
    @chef = Chef.new
  end

  def edit
  end


  def create
    @chef = Chef.new(chef_params)

    respond_to do |format|
      if @chef.save
        format.html { redirect_to chef_url(@chef), notice: "Chef was successfully created." }
        format.json { render :show, status: :created, location: @chef }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chef.update(chef_params)
        format.html { redirect_to chef_url(@chef), notice: "Chef was successfully updated." }
        format.json { render :show, status: :ok, location: @chef }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chef.destroy

    respond_to do |format|
      format.html { redirect_to chefs_url, notice: "Chef was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_chef
      @chef = Chef.find(params[:id])
    end

    def chef_params
      params.require(:chef).permit(:user_id, :address_id, :approver_id)
    end
end

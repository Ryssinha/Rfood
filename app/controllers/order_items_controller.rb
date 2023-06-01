class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    dish = Dish.find(params[:order_item][:dish_id])
    order = Order.find(params[:order_item][:order_id])
    respond_to do |format|
      if @order_item.save
        SendEmailChefJob.perform_later(dish, order)
        format.html { redirect_to order_item_url(@order_item), notice: "Item do pedido criado com sucesso." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:order_id, :dish_id, :amount, :unit_price)
    end
end

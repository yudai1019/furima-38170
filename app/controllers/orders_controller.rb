class OrdersController < ApplicationController

  def index
    @items = Item.includes(:user)
    @order_address = OrderAddress.new
  end

  def create
    @items = Item.includes(:user)
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

 private

  def order_params
    params.require(:order_address).permit(:municipality,:addressnum,:buildingname,:phonenum,:area_id).merge(user_id: current_user.id)
  end
end


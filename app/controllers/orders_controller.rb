class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_fa88fa22224682e92984a383"  
      Payjp::Charge.create(
        amount: order_params[:price],  
        card: order_params[:token],   
        currency: 'jpy'                 
      )
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

 private 

  def order_params
    params.require(:order_address).permit(:municipality,:addressnum,:buildingname,:phonenum,:area_id,:postnum).merge(user_id: current_user.id , token: params[:token])
  end
end


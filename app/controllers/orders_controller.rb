class OrderController < ApplicationController

  def index
    @item_address = Itemaddress.new
  end

  def create
    Itemaddress.create(item_params)
  end

  def item_params
    params.require(:item_address).permit( :name,:description_item , :category_id,:state_id,:load_id, :wait_id,:price,:area_id,:municipality,:addressnum、:buildingname、:phonenum,:order) 
           .merge(user_id: crrent_user.id)
  end


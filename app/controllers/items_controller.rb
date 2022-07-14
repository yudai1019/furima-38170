class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @item = Item.new
  end

  def create
     Item.create(params_item)
     redirect_to root_path
  end

private
def params_item
 params.require(:item).permit(:name,:description_item,:category_id,:state_id,:load_id,:area_id,:date_time_id,:price,:image).merge(user_id: current_user.id)
end

end


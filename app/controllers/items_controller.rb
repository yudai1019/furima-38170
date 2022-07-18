class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description_item, :category_id, :state_id, :load_id, :area_id, :wait_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end

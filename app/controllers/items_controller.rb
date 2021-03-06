class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :set_item, only: [:edit, :destroy]

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
  end

  def edit
    redirect_to root_path if @item.user_id != current_user.id || !@item.order.nil?
  end

  def update
    if @item.update(params_item)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def params_item
    params.require(:item).permit(:name, :description_item, :category_id, :state_id, :load_id, :area_id, :wait_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def set_item
    redirect_to root_path unless current_user.id == @item.user_id
  end
end

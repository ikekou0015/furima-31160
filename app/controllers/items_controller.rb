class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :image, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == Item.find(params[:id]).user_id
  end
end

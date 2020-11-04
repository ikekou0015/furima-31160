class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("created_at DESC")
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

  def destroy
  end

  def item_params
    params.require(:item). permit(:name, :info, :price, :category_id, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery)
  end
end

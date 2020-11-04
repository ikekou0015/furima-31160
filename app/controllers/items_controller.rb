class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
     #@genre = Genre.where(genre)
  end

  def create
  end

  def destroy
  end
end

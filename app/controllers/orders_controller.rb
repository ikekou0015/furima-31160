class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_tweet, only: [:index, :create]
  def index
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)

    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
  def move_to_index
    if current_user.id == Item.find(params[:item_id]).user_id
        redirect_to root_path
    end
  end

  def set_tweet
    @item = Item.find(params[:item_id])
  end
end

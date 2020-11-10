class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end
  
  def create
  
  @item = Item.find(params[:item_id])
  @form = Form.new(form_params)
    
if @form.valid? 
    @form.save
    redirect_to root_path
   else
    render action: :index
  end
end

  private

   def form_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number ).merge(item_id: params[:item_id], user_id: current_user.id)
   end

   def move_to_index
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end
end
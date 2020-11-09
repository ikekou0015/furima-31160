class OrdersController < ApplicationController
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
end
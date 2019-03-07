class ItemsController < ApplicationController



  def index 
    @items = Item.all
   
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item =  JoinTableCartItem.find_by(item_id: params[:id]) 
    @item.destroy
    
    redirect_to carts_path
  end

 


end

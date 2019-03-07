class CatpicsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.catpic.attach(params[:catpic])
    redirect_to(item_path(@item))
  end
end

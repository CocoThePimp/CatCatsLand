class PhotosController < ApplicationController
  def create
    @item = Item.find(params[:user_id])
    @item.image_url.attach(params[:image_url])
    redirect_to(items_path)
  end
end

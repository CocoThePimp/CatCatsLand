class ItemsController < ApplicationController

  def index 
    @items = Item.all

    #--- Mailer User ---
    NotificationMailer.send_order_email(current_user.email).deliver

    #--- Mailer Admin ---
    NotificationMailer.send_confirmation_email('AdminEmailThpStras@yopmail.com').deliver
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

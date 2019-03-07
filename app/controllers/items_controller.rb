class ItemsController < ApplicationController

  def index 
    @items = Item.all

    #--- Mailer User ---
    @user = current_user.email
    puts "ceci est user 1 : #{@user}"
    NotificationMailer.send_order_email(current_user.email).deliver
    puts"email user envoyé"

    #--- Mailer Admin ---
    NotificationMailer.send_confirmation_email('emailDeAdmin@lol.com').deliver
    puts"email admin envoyé"
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

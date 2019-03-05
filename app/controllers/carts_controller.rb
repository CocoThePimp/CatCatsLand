class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = JoinTableCartItem.find_by(cart_id: current_user.cart.id)
  end

  def create
    puts "#" * 30
    puts params
    @item = Item.find(params[:format])
    puts @item 
    puts "lol"
    @mix = JoinTableCartItem.new(cart_id: current_user.cart.id, item_id: @item.id)
    if @mix.save
      redirect_to items_path
    else
      render '/'
    end
  end
  
end

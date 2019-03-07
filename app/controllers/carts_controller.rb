class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cart = Cart.find_by(user: current_user)
    @selection = JoinTableCartItem.where(cart: @cart)
    @total = total
  end

  def create

    puts "#" * 30
    puts params
    @item = Item.find(params[:format])
    puts @item 
    puts "lol"
    @cart = Cart.find_by(user: current_user)
    @mix = JoinTableCartItem.new(cart_id: @cart.id, item_id: @item.id)
    if @mix.save
      flash[:success] = "La photo a bien été ajoutée au panier"
      redirect_to items_path
    else
      redirect_to root_path
    end

    def destroy
      @item =  Item.find(params[:id]) 
      puts "Branche"
      @item.destroy
      
      redirect_to carts_path
      puts "Bizarre"
    end

  end
  
  private

  def total
    total = 0
    @selection.each do |selection|
      total += selection.item.price
    end
    return total
  end
end

class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @selection = JoinTableCartItem.where(cart_id: current_user.cart.id)
    @total = total
  end

  def create
    if current_user.cart == nil
      Cart.create(user_id: current_user.id)
    end
    puts "#" * 30
    puts params
    @item = Item.find(params[:format])
    puts @item 
    puts "lol"
    @mix = JoinTableCartItem.new(cart: current_user.cart, item_id: @item.id)
    if @mix.save
      redirect_to items_path
    else
      render '/'
    end

    def destroy
      @selection = JoinTableCartItem.where(cart_id: current_user.cart.id)
      @selection.destroy_all
      redirect_to carts_path
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

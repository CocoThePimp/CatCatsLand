class OrdersController < ApplicationController

  def create
    puts '*' * 60
    puts params
    puts '*' * 60
    @item = Item.find(params[:id])
    @object = JoinTableCartItem.where(cart_id: @item.id)
    puts '*' * 60
    puts @item
    puts '*' * 60
    @object.each do |object|
      @order = OrderContent.new(item_id: @object)
      @order.save

    end
    
    
    
  end

  # private

  # def item_params
  #   params.require(:order_item).permit(:quantity, :product_id)
  # end


end

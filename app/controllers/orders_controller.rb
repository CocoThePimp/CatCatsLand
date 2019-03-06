class OrdersController < ApplicationController

  def create
    # puts '*' * 60
    # puts params
    # puts '*' * 60
    # @item = Item.find(params[:id])
    # @object = JoinTableCartItem.where(cart_id: @item.id)
    # puts '*' * 60
    # puts @item
    # puts '*' * 60
    # @object.each do |object|
    #   @order = OrderContent.new(item_id: @object)
    #   @order.save
      order_user
    end
    
    
    

  private

  def order_user
    @object = JoinTableCartItem.where(cart: current_user.cart)
    @order = Order.create(user: current_user)
    @object.each do |object|
      OrderContent.create(item_id: object.item_id, order_id: @order.id)
      object.destroy
    end
    redirect_to carts_path
  end

end

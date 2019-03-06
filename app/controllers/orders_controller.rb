class OrdersController < ApplicationController
  
  def show
  end

  def create
    @cart = Cart.find(params[:id])
    @cart_items = Join_table_cart_items.where(item_id: @cart)
    
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end



end

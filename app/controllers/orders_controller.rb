class OrdersController < ApplicationController

  
  def create
    
    @amount = params[:amount] * 100
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
   
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

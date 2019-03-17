class OrdersController < ApplicationController

  
  def create
    @cart = Cart.find_by(user: current_user)
    @amount = params[:amount].to_f
  
    @customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: @customer.id,
      amount: (@amount * 100).to_i,
      description: 'Rails Stripe customer',
      currency: 'eur'
    })
      order_user
  end


    

  private

  def order_user
    @object = JoinTableCartItem.where(cart: @cart)
    @order = Order.create(user: current_user, stripe_customer_id: @customer.id, amount: params[:amount])
    @object.each do |object|
      OrderContent.create(item_id: object.item_id, order_id: @order.id)
      object.destroy
    end
    sendgrid
    redirect_to profiles_path
  end



  def sendgrid
    #--- Mailer User ---
    NotificationMailer.send_order_email(current_user.email).deliver

    #--- Mailer Admin ---
    NotificationMailer.send_confirmation_email(current_user.email).deliver

  end 


end

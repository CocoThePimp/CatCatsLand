class OrdersController < ApplicationController
  before_action :authenticate_user!
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
      sendgrid
  end

    

  private

  def order_user
    @object = JoinTableCartItem.where(cart: @cart)
    @order = Order.create(user: current_user, stripe_customer_id: @customer.id, amount: params[:amount])
    @object.each do |object|
      OrderContent.create(item_id: object.item_id, order_id: @order.id)
      object.destroy
    end
    redirect_to profiles_path
    flash[:succeess]= "Merci de votre achat. Vous receverez un mail très prochainement."
  end
=begin
  def order_send(order)
    NotificationMailer.send_order_email(@order,@order.user).deliver_now
    NotificationMailer.send_confirmation_email(@order.items,@order.user).deliver_now
  end

=end

  def sendgrid
    #--- Mailer User ---
    NotificationMailer.send_order_email(current_user.email).deliver

    #--- Mailer Admin ---
    NotificationMailer.send_confirmation_email(current_user.email).deliver

  end 





end

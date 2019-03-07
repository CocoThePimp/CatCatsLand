class NotificationMailer < ApplicationMailer

  default :from => 'CatCatsLand@gmx.fr'



  def send_order_email(user, order)
    @user = user
    @order = order
    @liste = OrderContent.where(order: @order)
    attachment_def
    mail( :to => @user,
    :subject => 'Votre commande est arrivée!'
    )
  end

  def send_confirmation_email(user)
    @user = user
    attachment_def
    mail( :to => 'AdminEmailThpStras@yopmail.com',
      :subject => 'Nouvelle commande client!' )
  end

  def attachment_def
    @liste.each do |order|

    attachments['catpic'] = Base64.encode64('cat_1.jpg')
  end

end

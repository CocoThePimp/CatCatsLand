class NotificationMailer < ApplicationMailer

  default :from => 'CatCatsLand@gmx.fr'


  def send_order_email(user)
    @order = order
    @user = user
    @item = item
    attachments.inline['cat_pic'] = File.read(@item.catpic)
    end
    mail(:to => @order.current_user.email,
    :subject => 'Votre commande est arrivée!'
    )
  end

  def send_confirmation_email(user)
    @user = user
    mail(:to => 'AdminEmailThpStras@yopmail.com',
      :subject => "Nouvelle commande client de #{@user}" )
  end


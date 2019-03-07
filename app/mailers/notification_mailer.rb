class NotificationMailer < ApplicationMailer

  default :from => 'CatCatsLand@gmx.fr'



  def send_order_email(user)
    @user = user
    attachment_def
    mail( :to => @user,
    :subject => 'Votre commande est arrivée!'
    )
  end

  def send_confirmation_email(user)
    @user = user
    attachment_def
    mail( :to => 'AdminEmailThpStras@yopmail.com',
      :subject => "Nouvelle commande client de #{@user}" )
  end

  def attachment_def
    attachments['cat_pic'] = Base64.encode64('https://cat-cats-land.herokuapp.com/assets/cat_1-9742b1df7db28173032be6f0900494a610904f4918abbb14ddc35c48429face6.jpg')
    
  end

end

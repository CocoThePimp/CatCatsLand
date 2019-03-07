class NotificationMailer < ApplicationMailer

  default :from => 'catscatsland@gmx.fr'



  def send_order_email(user)
  @user = user
  puts "ceci est user 2 : #{@user}"

    #attachment_def
    #attachments['cat_1.jpg'] = File.read("#{Rails.root}/app/assets/images/cat_1.jpg")
    mail( :to => @user,
    :subject => 'Votre commande est arrivée!' )
  end


  def send_confirmation_email(user)
    @user = user
    puts "ceci est user 3 partie admin : #{@user}"
    #attachment_def
    mail( :to => 'AdminEmail@lol.com',
      :subject => 'Nouvelle commande client!' )
  end

  def attachment_def
    attachments['cat_1.jpg'] = File.read("#{Rails.root}/app/assets/images/cat_1.jpg")
  end



end

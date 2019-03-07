class NotificationMailer < ApplicationMailer

  default :from => 'catscatsland@gmx.fr'



  def send_order_email(user)
  @user = user
  puts "ceci est user 2 : #{@user}"

    #attachment_def
    #attachments['cat_1.jpg'] = File.read("#{Rails.root}/app/assets/images/cat_1.jpg")
    # a = attachments.create({
    #   file: 'cat_1.jpg',
    #   description: 'photo'
    # })
    #puts "ceci est l'attachment: #{a}"
    attachments['cat_1.jpg'] = Base64.decode64('https://cat-cats-land.herokuapp.com/assets/cat_1-9742b1df7db28173032be6f0900494a610904f4918abbb14ddc35c48429face6.jpg')
    mail( :to => 'nassrihamdi@gmail.com',
    :subject => 'Votre commande est arrivée!'
    )
  end


  def send_confirmation_email(user)
    @user = user
    puts "ceci est user 3 partie admin : #{@user}"
    #attachment_def
    mail( :to => 'AdminEmailThpStras@yopmail.com',
      :subject => 'Nouvelle commande client!' )
  end

  def attachment_def
    attachments.inline['cat_1.jpg'] = File.read("#{Rails.root}/app/assets/images/cat_1.jpg")
  end



end

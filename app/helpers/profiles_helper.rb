module ProfilesHelper
  def signed_in?
    !!current_user
  end
  
  def is_admin?
    signed_in? ? current_user.is_admin : false
  end
end

class ApplicationController < ActionController::Base

  helper_method :signed_in?, :is_admin?

  def signed_in?
    !!current_user
  end

  def is_admin?
    signed_in? ? current_user.is_admin : true
  end
end

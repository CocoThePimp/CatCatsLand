class RegistrationsController < Devise::RegistrationsController
  private
  
  # def sign_up_params
  #   params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  # end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def account_update_params
  #   params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  # end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

end

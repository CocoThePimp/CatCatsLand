class ProfilesController < ApplicationController
  
  def show
    @user=current_user
  end

  def update
    @user=current_user
    if @user.update_attributes(params[:user])
        sign_in 'user', @user, :bypass => true
        flash[:notice] = t('users.profile.edit.updated')
        respond_to do |format|
            format.html { redirect_to '/'}
        end
    else
      render 'devise/registration/edit'
    end
  end

end

# @user = User.find(params[:id])
 
# if @user.update('first_name' => params[:first_name],
#                 'last_name' => params[:last_name],
#                 'email' => params[:email],
#   redirect_to @profile, success: " Profil modifié avec succés! "
# else
#   render :edit
# end
class AdminController < ApplicationController
  before_action :authenticate_user!,  only: [:index]
  before_action :check_if_admin,  only: [:index]

  def index
    @admin = User.all
  end

  def show 

  end

  def new 

  end


  def create 

  end

  def destroy 
    
  end
  
  private 

  def check_if_admin
    unless current_user.is_admin
      flash[:notice] = "Accès interdit, tu n'es pas administrateur"
      redirect_to events_path
    end
  end

end
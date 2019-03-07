class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @admins = User.where(:all, :conditions => {:is_admin => true})
  end

  def show 

  end

  def new 

  end


  def create 

  end

  def destroy 
    
  end

end
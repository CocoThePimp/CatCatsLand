module Admin

  class UsersController < ApplicationController

    before_action :set_users, only: [:update, :edit, :destroy ]
    before_action :is_admin?, only: [:index]

    def index 
      @users = User.all
    end

    def new 
      @users = User.new
    end

    def create 
      @users = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
      if @users.save 
        redirect_to({action: :index}, success: "L'utilisateur a bien été créé")
      else 
        render "new"
      end
    end

    def edit 
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        redirect_to({action: :index}, success: "L'utilisateur a bien été modifié")
      else 
        render "new"
      end
    end

    def destroy
      @users.destroy
      redirect_to({action: :index}, success: "L'utilisateur a bien été supprimé")
    end

    private

    def set_users
      @users = User.find(params[:id])
    end

    def is_admin?
      if authenticate_user! ? current_user.is_admin : true
        flash.now[:success] = "Accès admin autorisé"
      else
        flash.now[:alert] = "Accès admin non autorisé"
        redirect_to items_path
      end
    end

  end

end
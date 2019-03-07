module Admin

  class OrdersController < ApplicationController

    before_action :set_orders, only: [:update, :edit, :destroy ]
    before_action :is_admin?, only: [:index]

    def index 
      @orders = Order.all
    end

    def edit 
      @order = Order.find(params[:id])
    end

    def update
      if @order.update(amount: params[:amount])
        redirect_to({action: :index}, success: "La commande a bien été modifiée")
      else 
        render "new"
      end
    end

    def destroy
      @order.destroy
      redirect_to({action: :index}, success: "La commande a bien été supprimée")
    end

    private

    def set_items
      @order = Order.find(params[:id])
    end

    def is_admin?
      if signed_in? ? current_user.is_admin : true
        flash.now[:success] = "Accès admin autorisé"
      else
        flash.now[:alert] = "Accès admin non autorisé"
        redirect_to items_path
      end
    end
  end

end
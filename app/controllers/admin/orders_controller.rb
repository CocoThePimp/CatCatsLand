module Admin

  class OrdersController < ApplicationController

    before_action :set_orders, only: [:update, :edit, :destroy ]

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

  end

end
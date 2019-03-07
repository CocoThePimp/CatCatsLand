module Admin

  class ItemsController < ApplicationController

    before_action :set_items, only: [:update, :edit, :destroy ]

    def index 
      @items = Item.all
    end

    def new 
      @item = Item.new
    end

    def create 
      @item = Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
      if @item.save 
        redirect_to({action: :index}, success: "Le produit a bien été créé")
      else 
        render "new"
      end
    end

    def edit 
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
        redirect_to({action: :index}, success: "Le produit a bien été modifié")
      else 
        render "edit"
      end
    end

    def destroy
      @item.destroy
      redirect_to({action: :index}, success: "Le produit a bien été supprimé")
    end

    private

    def set_items
      @item = Item.find(params[:id])
    end

  end

end
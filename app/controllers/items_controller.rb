class ItemsController < ApplicationController
  def index
  end

  def show
    @items = Item.includes(:images)
    @items = Item.find(params[:id])
  end
  
  def new
  end
end


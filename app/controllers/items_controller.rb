class ItemsController < ApplicationController
  def index
  end

  def show
    # @item = Item.includes(:images)
    @item = Item.find(params[:id])
  end
  
  def new
  end
end

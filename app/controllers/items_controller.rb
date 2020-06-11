class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
    @images = Image.all
  end
  
  def new
    @item = Item.new
    @image = Image.new
    @item.images.new
  end

  def show
  end
end

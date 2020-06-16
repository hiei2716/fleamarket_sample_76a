class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC').limit(8)
  end
  
  def new
    @item = Item.new
    @image = Image.new
    @item.images.new
  end

  def show
  end

  def top
    @items = Item.includes(:images).order('created_at DESC').limit(4)
    @items_category = Item.where(category_id: [1...200]).includes(:images).order('created_at DESC').limit(3)
  end

  require 'payjp'

  def pay
    Payjp.api_key = "sk_test_f1d2d99808bd87c9b416bd9c"
    Payjp::Charge.create(
      amount: 34439, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
end

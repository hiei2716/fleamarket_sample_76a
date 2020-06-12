class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit  #事前に商品情報編集用アクションを定義
    # @item = Item.find(params[:id])  
  end

  def update  #事前に商品情報更新用アクションを定義
    # item = Item.find(params[:id])
    # item.update(item_params)
    # redirect_to item_path(item.id)
  end
end

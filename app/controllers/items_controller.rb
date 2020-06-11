class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @item.images.new
  end

  def create
    @item = Item.create(item_params)
    # if @item.save
    #   redirect_to items_path, notice: "出品しました"
    # else
    #   redirect_to new_item_path, notice: "出品できません。入力必須項目を確認してください"
    # end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :price, :condition_id, :wait, :postage, :prefecture_id, :buyer_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)  
  end
end

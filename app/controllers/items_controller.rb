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
    # @item = Item.find(params[:id])
    # if @item = Item.update(item_params)
    #   redirect_to item_path, notice: "更新しました。"
    # else
    #   redirect_to edit_item_path, alert: "変更できません。入力必須項目を確認してください。"
    # end


  end

  private
  #item_params ストロングパラメータ
  # def item_params
  #   params.require(:item).permit(:name, :description, :category_id, :brand_id, :price, :condition_id, :wait, :postage, :prefecture_id, :buyer_id, images_attributes: [:src, :_destroy, :id])
  # end
end

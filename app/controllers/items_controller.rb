class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :edit, :destroy]

  def index
  end

  def show
  end
  
  def new
    @item = Item.new
    @category_parent_array = []
    @category = Category.roots.each do |parent|
    @category_parent_array << parent.name
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).premit(:name, :category_id, :price, :explanation, :condition, :shipping_fee, :shipping_day)
  end

end
